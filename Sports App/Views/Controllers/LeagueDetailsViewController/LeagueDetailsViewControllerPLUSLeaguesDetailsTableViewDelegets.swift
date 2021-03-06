//
//  LeagueDetailsViewControllerPLUSLeaguesDetailsTableViewDelegets.swift
//  Sports App
//
//  Created by mohamed youssef on 4/23/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import Foundation
import UIKit


extension LeagueDetailsViewController : UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        var heightForRow : CGFloat = 0.0

        switch indexPath.section {
        case 0:
            heightForRow = view.frame.height*0.26    // upcoming collection view
        case 1:
            heightForRow = view.frame.height*0.5    // last table view

        case 2:
            heightForRow = view.frame.height*0.2    // team collection view
        default:
            heightForRow = 0.0
        }

        return heightForRow
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
//    func numberOfItemsIn(section : Int = 0) -> Int {
//        return self.numberOfItems(inSection:section)
//    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var heightForHeader : CGFloat = 0.0

        switch section {
        case 0:
            heightForHeader = view.frame.height*0.05    // upcoming collection view
        case 1, 2:
            heightForHeader = view.frame.height*0.03    // last table view & team collection view
        default:
            heightForHeader = 0.0
        }

        return heightForHeader
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var titleOfSections = ""
        
        switch section {
        case 0:
            titleOfSections = "Upcoming Events"    // upcoming collection view
        case 1:
            titleOfSections = "Last Events"    // last table view
            
        case 2:
            titleOfSections = "Teams"    // team collection view
        default:
            titleOfSections = ""
        }
        
        return titleOfSections
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            
            guard let cell = leagueDetailsTableView.dequeueReusableCell(withIdentifier: String(describing: UpcomingEventTableViewCell.self), for: indexPath)  as? UpcomingEventTableViewCell else {
                return UITableViewCell()
            }

            cell.leagueEventsDetails = leaguesDetailsPresenter!.leagueEventsDetails
            cell.homeTeamDetails = leaguesDetailsPresenter!.homeTeamDetails
            cell.awayTeamDetails = leaguesDetailsPresenter!.awayTeamDetails
            
            //cell.awayTeamDetails = leaguesDetailsPresenter?.teamDetails
            
            return cell
            
            
        case 1:
            
            guard let cell = leagueDetailsTableView.dequeueReusableCell(withIdentifier: String(describing: LastEventTableViewCell.self), for: indexPath)  as? LastEventTableViewCell else {
                return UITableViewCell()
            }
            
            cell.leagueEventsDetails = leaguesDetailsPresenter!.leagueEventsDetails
            cell.homeTeamDetails = leaguesDetailsPresenter!.homeTeamDetails
            cell.awayTeamDetails = leaguesDetailsPresenter!.awayTeamDetails
            
            
            return cell
      
        case 2:
            
            guard let cell = leagueDetailsTableView.dequeueReusableCell(withIdentifier: String(describing: TeamsTableViewCell.self), for: indexPath)  as? TeamsTableViewCell else {
                return UITableViewCell()
            }
            
            cell.leagueTeamsDetails = leaguesDetailsPresenter!.leagueTeamsDetails
            
            cell.didSelectItemAtIndexPath = { [weak self] indexPath in
                self?.indexPath = indexPath.row
                self?.performSegue(withIdentifier: "teamDetails", sender: self)
            }
            
            
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? TeamsDetailsTableViewController

        if segue.identifier == "teamDetails"{
            print("TeamId: \(leaguesDetailsPresenter?.leagueTeamsDetails[self.indexPath!].idTeam)")
            destination!.team = leaguesDetailsPresenter?.leagueTeamsDetails[self.indexPath!]
        }
    }
    
}

