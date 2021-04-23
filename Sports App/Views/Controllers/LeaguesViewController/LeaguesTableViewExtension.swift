//
//  LeaguesTableViewExtension.swift
//  Sports App
//
//  Created by Wesam on 4/22/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import Foundation
import UIKit

extension LeaguesViewController: UITableViewDelegate ,UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaguePresenter?.filtireData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("inside cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilteredLeagueCell", for: indexPath) as! FilteredLeagueViewTableViewCell
        
        cell.filteredLeagueName.text = leaguePresenter?.filtireData?[indexPath.row].leaguesName
        
        
        cell.filteredLeagueImage.sd_setImage(with: URL(string: leaguePresenter?.filtireData?[indexPath.row].leaguesImage ?? ""), placeholderImage: UIImage(named: "placeHolder.png"))

        if(leaguePresenter?.filtireData?[indexPath.row].youtube != "" &&
            leaguePresenter?.filtireData?[indexPath.row].youtube != nil){
            cell.filteredYoutubeImage.isHidden = false
        }else{
            cell.filteredYoutubeImage.isHidden = true
        }
       
        cell.yotubeButton = {
            print("youtube button index\(indexPath.row)")
            self.selectedLeagues = indexPath.row
            self.performSegue(withIdentifier: "webView", sender: self)
            
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row index \(indexPath.row)")
        self.selectedLeagues = indexPath.row
        self.performSegue(withIdentifier: "leagueDetails", sender: self)
    }
}
