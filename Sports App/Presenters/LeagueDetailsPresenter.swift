//
//  LeagueDetailsPresenter.swift
//  Sports App
//
//  Created by mohamed youssef on 4/23/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import Foundation
import CoreData

protocol LeagueDetailsView: class {
    func reloadData()
    func startAnimating()
    func stopAnimating()
}

protocol LeagueDetailsViewPresenter {
    init(view: LeagueDetailsView)
    func getEventsData(apiURL: String, id: String)
    func getTeamsData(apiURL: String, id: String)
    func saveLeagueToCoreData(leagueID: String, leagueName: String, leagueYoutubeLink: String, leagueImage: String)
    func deleteLeaguefromCoreData(leagueID: String)
}

class LeagueDetailsPresenter : LeagueDetailsViewPresenter{

   // A group of blocks submitted to queues for asynchronous invocation.
    let dispatchGroup = DispatchGroup()
    weak var view : LeagueDetailsView?
    
    // favorite
    var favoriteLeague = NSManagedObject()
    var fetchedLeaguesArray = [NSManagedObject](){
    didSet{
        self.view?.reloadData()
    }
}
    
    var homeTeamDetails = [[Team]]()
    var leagueTeamsDetails = [Team](){
        didSet{
            self.view?.stopAnimating()
            self.view?.reloadData()
        }
        
    }
    var awayTeamDetails = [[Team]](){
        didSet{
            if awayTeamDetails.count == leagueEventsDetails.count{
                self.view?.stopAnimating()
                self.view?.reloadData()
            }
        }
    }
    
    required init(view: LeagueDetailsView) {
        self.view = view
    }
    
    var leagueEventsDetails = [Event](){
        didSet{
            
            for i in 0..<leagueEventsDetails.count{
              //  Manually indicate a block has entered the group
                dispatchGroup.enter()
                
                if leagueEventsDetails[i].idHomeTeam != nil{
            //  teamDetails = "https://www.thesportsdb.com/api/v1/json/1/lookupteam.php?id=133611"
                    ApiServices.instance.getResponses(url: URLs.teamDetails.rawValue, id: leagueEventsDetails[i].idHomeTeam ?? "") { (data: Teams?, error) in
                        guard let teamData = data, error == nil else{
                            return
                        }
                        self.homeTeamDetails.append(teamData.teams!)
                    }
                }
            }
            //Calling this function indicates block has completed and left the dispatch
            dispatchGroup.leave()

            for i in 0..<leagueEventsDetails.count{
                //Manually indicate a block has entered the group
                dispatchGroup.enter()
                
                if leagueEventsDetails[i].idAwayTeam != nil{
                    ApiServices.instance.getResponses(url: URLs.teamDetails.rawValue, id: leagueEventsDetails[i].idAwayTeam ?? "") { (data: Teams?, error) in

                        guard let teamData = data, error == nil else{
                            return
                        }
                        self.awayTeamDetails.append(teamData.teams!)
                    }
                }else{
                    self.view?.stopAnimating()
                    self.view?.reloadData()
                }
            }
            dispatchGroup.leave()


//            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute:{
//                self.view?.stopAnimating()
//                self.view?.reloadTable()
//                })
            
          }
    }

    
    
   
    
    func getEventsData(apiURL: String, id: String) {
                
        view?.startAnimating()
        //leaguesDetailsPresenter?.getEventsData(apiURL: ApiURLs.leagueEvents.rawValue, id: leagueID ?? "")
        //leagueEvents = "https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php?id="

        ApiServices.instance.getResponses(url: apiURL, id: id) { (data: EventsModel?, error) in
            
            guard let eventData = data, error == nil else{
                return
            }
            
            self.leagueEventsDetails = eventData.events!
        }
    }
 
    func getTeamsData(apiURL: String, id: String) {
        
        view?.startAnimating()
        // case leagueTeams = "https://www.thesportsdb.com/api/v1/json/1/lookup_all_teams.php?id=4328"
//         leaguesDetailsPresenter?.getTeamsData(apiURL: ApiURLs.leagueTeams.rawValue, id: leagueID ?? "")
        ApiServices.instance.getResponses(url: apiURL, id: id) { (data: Teams?, error) in
            
            guard let teamData = data, error == nil else{
                return
            }
            
            self.leagueTeamsDetails = teamData.teams!
        }
    
    }
    
    
    
    
    
    // coreData
    func saveLeagueToCoreData(leagueID: String, leagueName: String, leagueYoutubeLink: String, leagueImage: String){
        

    }
    
    func fetchLeaguefromCoreData(){

      }
    
    func deleteLeaguefromCoreData(leagueID: String){
        
       fetchLeaguefromCoreData()

    }
    
    
    func isFavoriteLeague(leagueID: String) -> Bool{

        fetchLeaguefromCoreData()

        var isFavorite = false

        for i in 0..<fetchedLeaguesArray.count{
            if fetchedLeaguesArray[i].value(forKey: "favoriteId") as! String == leagueID{
                isFavorite = !isFavorite
                break
            }
        }

        return isFavorite
    }
    
}
