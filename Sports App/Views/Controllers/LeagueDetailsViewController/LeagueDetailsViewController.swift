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

    var leaguesObject : League?
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
        
        leaguesDetailsPresenter?.getEventsData(apiURL: URLs.leagueEvents.rawValue, id: leaguesObject?.leaguesId ?? "")
        leaguesDetailsPresenter?.getTeamsData(apiURL: URLs.leagueTeams.rawValue, id: leaguesObject?.leaguesId ?? "")
        
        // favorite
        if leaguesDetailsPresenter?.isFavoriteLeague(leagueID: (leaguesObject?.leaguesId)!) == true{
            favoriteBtn.tintColor = UIColor.red
        }else{
            favoriteBtn.tintColor = UIColor.gray
        }
        

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
            leaguesDetailsPresenter?.saveLeagueToCoreData(leagueID: leaguesObject?.leaguesId ?? "", leagueName: leaguesObject?.leaguesName ?? "", leagueYoutubeLink: leaguesObject?.youtube ?? "", leagueImage: leaguesObject?.leaguesImage ?? "")
            
        }else{
            
            favoriteBtn.tintColor = UIColor.gray
            leaguesDetailsPresenter?.deleteLeaguefromCoreData(leagueID: leaguesObject?.leaguesId ?? "")
            
        }
    }
    


}
