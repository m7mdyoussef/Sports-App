//
//  FavoriteTableViewExtension.swift
//  Sports App
//
//  Created by Wesam on 4/22/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import Foundation

import UIKit

extension FavoriteViewController: UITableViewDelegate ,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfFavorite
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("inside cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueViewTableViewCell", for: indexPath) as! LeagueViewTableViewCell
        
        if let favorite = presenter.favorite(forRow: indexPath.row) {
            cell.leagueName.text = favorite.favoritName
            cell.leagueImage.sd_setImage(with: URL(string: favorite.favoriteImage ?? ""), placeholderImage: UIImage(named: "placeHolder.png"))
            
            
            if(favorite.favoriteYoutubeURL != ""){
                cell.youtubeImage.isHidden = false
            }
        }
       
//        cell.yotubeButton = {
//            print("youtube button index\(indexPath.row)")
//            //self.selectedLeagues = indexPath.row
//            self.performSegue(withIdentifier: "webView", sender: self)
//
//        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row index \(indexPath.row)")
        //self.selectedLeagues = indexPath.row
        self.performSegue(withIdentifier: "leagueDetails", sender: self)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        print("Deleted")

        if let id = presenter.favorites[indexPath.row].favoriteId{
            presenter.deleteObject(leaguesId: id)
        }
       
      }
    }
}
