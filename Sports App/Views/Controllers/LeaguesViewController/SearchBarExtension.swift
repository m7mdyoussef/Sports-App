//
//  SearchBarExtension.swift
//  Sports App
//
//  Created by Wesam on 4/23/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import Foundation
import UIKit

extension LeaguesViewController{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        leaguePresenter?.filtireData = []
        
        if searchText == "" {
            leaguePresenter?.filtireData = leaguePresenter?.leagues
        }else{
            if let leagues = leaguePresenter?.leagues{
                for item in leagues {
                    if item.leaguesName!.lowercased().contains(searchText.lowercased()){
                        
                        leaguePresenter?.filtireData?.append(item)
                        
                    }
                }
            }
            
        }
        leaguesTableView.reloadData()
        
    }

    
    
}
