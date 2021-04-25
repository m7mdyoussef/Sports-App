//
//  FavoriteViewController.swift
//  Sports App
//
//  Created by mohamed youssef on 4/19/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import UIKit
import CoreData
import Reachability

class FavoriteViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyLable: UILabel!
    var selectedLeagues : Int?
       let reachability = try! Reachability()
       var presenter: FavoriteListPresenter!
       var context: NSManagedObjectContext?

    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
               
               context = appDelegate.persistentContainer.viewContext
               presenter = FavoriteListPresenter(view: self, context: context!)
               
                   print("favorite view load")
                   
                   networkNotificationObserver()
        
        
//        let league = League(leaguesId: "favorite.favoriteId!", leaguesName: "favorite.favoritName!", leaguesImage: "favorite.favoriteImage!", youtube: "favorite.favoriteYoutubeURL!", sportName: "")
//        presenter.didTapInsertAction(league: league)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.loadFavorite()
    }
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "favoriteLeagueDetails"{
            if let destination = segue.destination as? LeagueDetailsViewController{
                
                let favorite = self.presenter.favorites[selectedLeagues!]
                
                let league = League(leaguesId: favorite.favoriteId!, leaguesName: favorite.favoritName!, leaguesImage: favorite.favoriteImage!, youtube: favorite.favoriteYoutubeURL!, sportName: "")
                
                destination.leaguesObject = league
                destination.hidesBottomBarWhenPushed = true
                
            }
            
        }else if segue.identifier == "favoriteWebView"{
            if let destination = segue.destination as? WebViewController{
                
                destination.leaguesWebURl =  self.presenter.favorites[selectedLeagues!].favoriteYoutubeURL ?? ""
                destination.hidesBottomBarWhenPushed = true
            }
        }
      
    }
    
    func showNetworkConnectionErroe(){
        let alert = UIAlertController(title: "Error", message: "please check your internt connection", preferredStyle: .alert)
        
        let okAction  = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
            
            
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func networkNotificationObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(internetChange(notification:)), name: .reachabilityChanged, object: reachability)
           do{
             try reachability.startNotifier()
           }catch{
             print("could not start reachability notifier")
           }
    }
    

}

extension FavoriteViewController: FavoriteListPresenterOutput {
    func showEmptyListImage() {
        print(" list not empty")
        emptyLable.isHidden = true
    }
    
    func hideEmptyListImage() {
        print("empty list")
        emptyLable.isHidden = false
    }
    
    func upadteFavorite() {
        tableView.reloadData()
    }

}
