//
//  LeaguesViewController.swift
//  Sports App
//
//  Created by mohamed youssef on 4/19/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import UIKit

class LeaguesViewController: UIViewController, UISearchBarDelegate{

    var sport : String?
    var leaguePresenter : LeaguesPresenter?
    var selectedLeagues : Int?
    var indicator : ShowIndecator?
 
    
   
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var leaguesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        indicator = ShowIndecator(view: self.view)
        
        leaguePresenter = LeaguesPresenter(view: self, sportName: sport)
        leaguePresenter?.getLeagues()
        
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "leagueDetails"{
            if let destination = segue.destination as? LeagueDetailsViewController{
                
                destination.leaguesObject =  self.leaguePresenter?.leagues?[selectedLeagues!]
            }
            
        }else if segue.identifier == "webView"{
            if let destination = segue.destination as? WebViewController{
                destination.leaguesWebURl =  self.leaguePresenter?.filtireData?[selectedLeagues!].youtube ?? ""
                
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


