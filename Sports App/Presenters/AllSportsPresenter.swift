//
//  AllSportsPresenter.swift
//  Sports App
//
//  Created by mohamed youssef on 4/21/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import Foundation

protocol SportsView : class {
    func reloadData()
    func startAnimating()
    func stopAnimating()
}


protocol SportsViewPresenter {
    init(view : SportsView)
    var sports : [Sport]?{get set}
    func getSports()
}

class SportsPresenter: SportsViewPresenter { // 2.1  2->1  conform

    var sports: [Sport]?{   // 2.2 2->1  implement
        didSet{
            self.view?.reloadData()  ////  4  1 -> 0   calling protocol method
            view?.stopAnimating()    ////  4  1 -> 0   calling protocol method
        }
    }
    
    weak var view : SportsView?  ////3  1 -> 0  protocol property
    
    required init(view: SportsView) {  ////  3  1 -> 0  to set   p.self in VC
        self.view = view
    }
    
    func getSports() {  // 2.2 2->1  implement
        
            view?.startAnimating()  ////  4  1 -> 0   calling protocol method
            
             // 5   2 -> 1 singleton ==  // set property .self
             // 3   2-> 1     &&   4  2-> 1   not required to set protocol prop. and call protocol methods.
        
            ApiServices.instance.getResponses(url: URLs.allSports.rawValue) { (data: SportsModel?, error) in
                        
                guard let data = data, error == nil else{
                    return
                }
                self.sports = (data.sports)!
                //success  so -> reload data + stop animating
            }
    }
    
}
