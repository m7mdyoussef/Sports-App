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
        if let facebookURL = teamPresenter?.teams?[0].facebook {
            if( facebookURL != ""){
                self.facebookButton.isHidden = false
            }
            
        }
        
        if let instagramURL = teamPresenter?.teams?[0].instagram {
            if( instagramURL != ""){
                self.instaButton.isHidden = false
            }
            
        }
        
        if let twitterURL = teamPresenter?.teams?[0].twitter {
            if( twitterURL != ""){
                self.twitterButton.isHidden = false
            }
            
        }
       

    
    }
}
