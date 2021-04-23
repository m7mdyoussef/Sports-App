//
//  LeagueDetailsViewController.swift
//  Sports App
//
//  Created by mohamed youssef on 4/19/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import UIKit
import CoreData

class LeagueDetailsViewController: UIViewController, LeagueDetailsView {

    var indexPath : Int?
    var leaguesDetailsPresenter : LeagueDetailsPresenter?
    var leagueID : String?
    
    var leagueName : String?
    var leagueYoutubeLink : String?
    var leagueImage : String?
    
   // let delegate = (UIApplication.shared.delegate as! AppDelegate)
    
    var indicator : ShowIndecator?
    
    @IBOutlet weak var leagueDetailsTableView: UITableView!
    @IBOutlet weak var favoriteBtn: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

               
        leaguesDetailsPresenter = LeagueDetailsPresenter(view: self)
        
        leaguesDetailsPresenter?.getEventsData(apiURL: URLs.leagueEvents.rawValue, id: leagueID ?? "4328")
        leaguesDetailsPresenter?.getTeamsData(apiURL: URLs.leagueTeams.rawValue, id: leagueID ?? "4328")
        
//        if leaguesDetailsPresenter?.isFavoriteLeague(leagueID: leagueID!) == true{
//            favoriteBtn.tintColor = UIColor.red
//        }else{
//            favoriteBtn.tintColor = UIColor.gray
//        }

        self.title = leagueName
        
        indicator = ShowIndecator(view: leagueDetailsTableView)
    }
    func reloadData() {
        DispatchQueue.main.async {
            self.leagueDetailsTableView.reloadData()
        }
        
    }
    
    func startAnimating() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.indicator?.startAnimating()
        }
    }
    
    func stopAnimating() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.indicator?.stopAnimating()
        }
    }
    
    @IBAction func saveToFavorite(_ sender: Any) {
        
        if favoriteBtn.tintColor == UIColor.gray{
            
            favoriteBtn.tintColor = UIColor.red
            leaguesDetailsPresenter?.saveLeagueToCoreData(leagueID: leagueID ?? "", leagueName: leagueName ?? "", leagueYoutubeLink: leagueYoutubeLink ?? "", leagueImage: leagueImage ?? "")
            
        }else{
            
            favoriteBtn.tintColor = UIColor.gray
            leaguesDetailsPresenter?.deleteLeaguefromCoreData(leagueID: leagueID!)
            
        }
    }
    


}
