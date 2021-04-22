//
//  LeaguesViewControllerExtension.swift
//  Sports App
//
//  Created by Wesam on 4/22/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import Foundation

extension LeaguesViewController: ILeaguesView{

    

    func reloadLeague() {
        print("reload Data")
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            self.leaguesTableView.reloadData()
        })

    }
    
    func startAnimating() {
        activityIndicator.hidesWhenStopped = true
        self.activityIndicator.center = self.leaguesTableView.center
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func stopAnimating() {
        activityIndicator.stopAnimating()
    }
    
    
}
