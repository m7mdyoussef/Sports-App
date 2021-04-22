//
//  LeaguesPresenter.swift
//  Sports App
//
//  Created by Wesam on 4/22/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import Foundation



class LeaguesPresenter: ILeaguesPresenter {
    
    var leagues: [League]?{
        didSet{
            self.view?.reloadLeague()
            view?.stopAnimating()
        }
    }
    
    weak var view : ILeaguesView?
    var sportName : String?
    
    required init(view: ILeaguesView, sportName: String?) {
        self.view = view
        self.sportName = sportName
    }
    
    func getLeagues() {
        view?.startAnimating()
        
        ApiServices.instance.getResponses(url: URLs.allLeagues.rawValue, id: sportName ?? "Soccer") { (data: Leagues?, error) in
                    
            guard let data = data, error == nil else{
                return
            }
            
            self.leagues = (data.leagues)!
    }
    
    
    }
    
}
