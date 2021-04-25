//
//  NavigateMethod.swift
//  Sports App
//
//  Created by Wesam on 4/24/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import Foundation
import UIKit


extension TeamsDetailsTableViewController{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "facebook"{
            
            if let destination = segue.destination as? WebViewController{
                
                destination.leaguesWebURl = self.team?.strFacebook  ?? ""
            }
            
        }else if segue.identifier == "instagram"{
            if let destination = segue.destination as? WebViewController{
                destination.leaguesWebURl =  self.team?.strInstagram ?? ""
                
            }
        }else if segue.identifier == "twitter"{
            if let destination = segue.destination as? WebViewController{
                destination.leaguesWebURl =  self.team?.strTwitter ?? ""
                
            }
        }
      
    }
    
}

