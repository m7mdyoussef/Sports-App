//
//  TeamsDetailsTableViewController.swift
//  Sports App
//
//  Created by Wesam on 4/19/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import UIKit

class TeamsDetailsTableViewController: UITableViewController {

    

    @IBOutlet weak var stadiumImage: UIImageView!
    @IBOutlet weak var badgeImage: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    
    @IBOutlet weak var stadiumLabel: UILabel!
    @IBOutlet weak var leaguesLabel: UILabel!
    
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var countryImage: UILabel!
    
    
    var teamId : String?
    var teamPresenter : TeamDetailsPresenter?
    var indicator : ShowIndecator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicator = ShowIndecator(view: self.view)
        teamPresenter = TeamDetailsPresenter(view: self, teamId: teamId)
        teamPresenter?.getTeams()
        
    }

    
    @IBAction func instaButtonClicked(_ sender: Any) {
    }
    
    @IBAction func facebookButtonClicked(_ sender: Any) {
    }
    
    
    @IBAction func twitterButtonClicked(_ sender: Any) {
    }
    
    func showErreorMessage() {
        
        let alert = UIAlertController(title: "Error", message: teamPresenter?.error, preferredStyle: .alert)
        
        let okAction  = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
            
            
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        
    }
}
