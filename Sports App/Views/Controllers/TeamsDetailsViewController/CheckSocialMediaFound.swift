//
//  CheckSocialMediaFound.swift
//  Sports App
//
//  Created by Wesam on 4/24/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import Foundation


extension TeamsDetailsTableViewController {

    func checkSocialMedia() {
        if let facebookURL = team?.strFacebook {
            if( facebookURL != ""){
                self.facebookButton.isHidden = false
            }
            
        }
        
        if let instagramURL = team?.strInstagram{
            if( instagramURL != ""){
                self.instaButton.isHidden = false
            }
            
        }
        
        if let twitterURL = team?.strTwitter {
            if( twitterURL != ""){
                self.twitterButton.isHidden = false
            }
            
        }
        
        if let stadium = team?.strStadium {
            if( stadium != ""){
                self.stadiumText.isHidden = false
            }
        }
       

    
    }
}
