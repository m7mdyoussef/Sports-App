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
    
    var selectedLeagues : Int?
    @IBOutlet weak var tableView: UITableView!
    let reachability = try! Reachability()
    
//    private(set) var presenter: FavoriteistPresenterInput!
//
//        func inject(presenter: FavoriteistPresenterInput) {
//            self.presenter = presenter
//        }
    
    var presenter: FavoriteListPresenter!
    var context: NSManagedObjectContext?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        context = appDelegate.persistentContainer.viewContext
        presenter = FavoriteListPresenter(view: self, context: context!)
        
            print("favorite view load")
            presenter.loadFavorite()
//        let league = League(leaguesId: "test1", leaguesName: "test", leaguesImage: "test", youtube:"test", sportName: "")
//
//        presenter.didTapInsertAction(league: league)
        
        //presenter.deleteObject(leaguesId: "test3")
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "favoriteLeagueDetails"{
            if let destination = segue.destination as? LeagueDetailsViewController{
                
                let favorite = self.presenter.favorites[selectedLeagues!]
                
                let league = League(leaguesId: favorite.favoriteId!, leaguesName: favorite.favoritName!, leaguesImage: favorite.favoriteImage!, youtube: favorite.favoriteYoutubeURL!, sportName: "")
                
                destination.leaguesObject = league
                
            }
            
        }else if segue.identifier == "favoriteWebView"{
            if let destination = segue.destination as? WebViewController{
                
                destination.leaguesWebURl =  self.presenter.favorites[selectedLeagues!].favoriteYoutubeURL ?? ""
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
    

}

extension FavoriteViewController: FavoriteListPresenterOutput {
    func upadteFavorite() {
        tableView.reloadData()
    }

}
