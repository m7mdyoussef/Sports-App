//
//  LeaguesViewController.swift
//  Sports App
//
//  Created by mohamed youssef on 4/19/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import UIKit

class LeaguesViewController: UIViewController{

    var sport : String?
    var leaguePresenter : LeaguesPresenter?
    var activityIndicator: UIActivityIndicatorView!
    var selectedLeagues : Int?
    
    @IBOutlet weak var leaguesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        activityIndicator = UIActivityIndicatorView(style: .large)
        
        leaguePresenter = LeaguesPresenter(view: self, sportName: sport)
        leaguePresenter?.getLeagues()
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "leagueDetails"{
            if let destination = segue.destination as? LeagueDetailsViewController{
                
                destination.leaguesId =  self.leaguePresenter?.leagues?[selectedLeagues!].leaguesId ?? ""
            }
            
        }else if segue.identifier == "webView"{
            if let destination = segue.destination as? WebViewController{
                
                destination.leaguesWebURl =  self.leaguePresenter?.leagues?[selectedLeagues!].youtube ?? ""
            }
        }
      
    }

    func showErreorMessage() {
        
        let alert = UIAlertController(title: "Error", message: leaguePresenter?.error, preferredStyle: .alert)
        
        let okAction  = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
            
            
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}


