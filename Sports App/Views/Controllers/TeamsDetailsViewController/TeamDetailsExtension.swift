//
//  TeamDetailsExtension.swift
//  Sports App
//
//  Created by Wesam on 4/24/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import Foundation
import UIKit

extension TeamsDetailsTableViewController : ITeamView{
    
    func reloadTeams() {
        print("reload team data")
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            self.teamNameLabel.text = self.teamPresenter?.teams?[0].teamName
            self.countryImage.text = self.teamPresenter?.teams?[0].country
            self.stadiumLabel.text = self.teamPresenter?.teams?[0].stadium
            self.leaguesLabel.text = self.teamPresenter?.teams?[0].leaguesName
             self.discriptionLabel.text = self.teamPresenter?.teams?[0].description
            self.badgeImage.sd_setImage(with: URL(string: self.teamPresenter?.teams?[0].badge ?? ""), placeholderImage: UIImage(named: "placeHolder.png"))
            
            self.stadiumImage.sd_setImage(with: URL(string: self.teamPresenter?.teams?[0].badge ?? ""), placeholderImage: UIImage(named: "placeHolder.png"))
            
           
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
