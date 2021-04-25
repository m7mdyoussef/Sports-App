//
//  TeamDetailsExtension.swift
//  Sports App
//
//  Created by Wesam on 4/24/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import Foundation
import UIKit
import YKPhotoCircleCrop

extension TeamsDetailsTableViewController{
    
    func reloadTeams() {
        print("reload team data")
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            self.teamNameLabel.text = self.team?.strTeam
            self.countryImage.text = self.team?.strCountry
            self.stadiumLabel.text = self.team?.strStadium
            self.leaguesLabel.text = self.team?.strLeague
            self.discriptionLabel.text = self.team?.strDescriptionEN
            
            self.badgeImage.sd_setImage(with: URL(string: self.team?.strTeamBadge ?? ""), placeholderImage: UIImage(named: "placeHolder.png"))
            
//            let circleCropController = YKCircleCropViewController()
//            circleCropController.image = UIImage(named: self.badgeImage.sd_setImage(with: URL(string: self.teamPresenter?.teams?[0].badge ?? ""), placeholderImage: UIImage(named: "placeHolder.png")))!
            //circleCropController.delegate = self
//            self.present(circleCropController, animated: true, completion: nil)
            
            self.stadiumImage.sd_setImage(with: URL(string: self.team?.strStadiumThumb ?? ""), placeholderImage: UIImage(named: "stadium.jpg"))
            
            self.teamView.isHidden = false
            
            self.checkSocialMedia()
            
           
        })
        
    }
    
    
}
