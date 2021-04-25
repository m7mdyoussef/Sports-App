//
//  TeamsDetailsTableViewController.swift
//  Sports App
//
//  Created by Wesam on 4/19/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import UIKit

class TeamsDetailsTableViewController: UITableViewController {

    var team :Team?

    @IBOutlet weak var stadiumImage: UIImageView!
    @IBOutlet weak var badgeImage: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    
    @IBOutlet weak var stadiumLabel: UILabel!
    @IBOutlet weak var leaguesLabel: UILabel!
    
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var countryImage: UILabel!
    
    @IBOutlet weak var twitterButton: UIButton!
    
    @IBOutlet weak var instaButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!


    @IBOutlet weak var stadiumText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        badgeImage.makeRounded()
        self.reloadTeams()
        
    }

    @IBOutlet weak var teamView: UIView!
    
    @IBAction func instaButtonClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "instagram", sender: self)
    }
    
    @IBAction func facebookButtonClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "facebook", sender: self)
    }
    
    
    @IBAction func twitterButtonClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "twitter", sender: self)
    }

}


