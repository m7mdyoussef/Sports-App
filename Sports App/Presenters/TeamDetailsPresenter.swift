//
//  TeamDetailsPresenter.swift
//  Sports App
//
//  Created by Wesam on 4/24/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import Foundation

class TeamDetailsPresenter: ITeamPresenter {
    
    
    var teams: [TeamDetail]?{
        didSet{
            self.view?.reloadTeams()
            view?.stopAnimating()
        }
    }
    
    var error: String?{
        didSet{
            self.view?.errorMessage()
            view?.stopAnimating()
        }
    }
    
    weak var view : ITeamView?
    var teamId : String?
    
    required init(view: ITeamView, teamId: String?) {
        self.view = view
        self.teamId = teamId
    }
    
    
    func getTeams() {
        view?.startAnimating()
        
        ApiServices.instance.getResponses(url: URLs.teamDetails.rawValue, id: "133604" ?? "133604") { (data: TeamsDetails?, errorMessage) in
                    
            guard let data = data, errorMessage == nil else{
                print("error")
                self.error = errorMessage?.localizedDescription
                return
            }
            
            if data.teams != nil{
                self.teams = data.teams
            }

       }
    }
    
}

