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
        indicator?.startAnimating()
    }
    
    func stopAnimating() {
        indicator?.stopAnimating()
    }
    
    func errorMessage() {
        print("errorMessage")
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            self.showErreorMessage()
        })
        
    }
    
    
}
