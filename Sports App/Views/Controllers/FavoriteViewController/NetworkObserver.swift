//
//  NetworkObserver.swift
//  Sports App
//
//  Created by Wesam on 4/23/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import Foundation
import Reachability

extension FavoriteViewController{
    
    @objc func internetChange(notification: Notification){
        let reachability = notification.object as! Reachability

        if reachability.connection != .unavailable{
            switch reachability.connection {
            case .wifi:
                print("Reachable via WiFi")
            case .cellular:
                print("Reachable via Cellular")
            case .unavailable:
              print("Network not reachable")
            case .none:
               print("Network not reachable")
            }
            
        }else{
            print("Network not available")
        }

        
    }
    
}


