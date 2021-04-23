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
    var filtireData: [League]?{
        didSet{
            //self.view?.reloadLeague()
            ///view?.stopAnimating()
            print("filter data")
        }
    }
    var error: String?{
        didSet{
            self.view?.errorMessage()
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
        
        ApiServices.instance.getResponses(url: URLs.allLeagues.rawValue, id: sportName ?? "Soccer") { (data: Leagues?, errorMessage) in
                    
            guard let data = data, errorMessage == nil else{
                print("error")
                self.error = errorMessage?.localizedDescription
                return
            }
            
            if data.leagues != nil{
                self.leagues = data.leagues
                self.filtireData = data.leagues
            }

            
    }
    
    
    }
    
}
