//
//  FavoriteViewController.swift
//  Sports App
//
//  Created by mohamed youssef on 4/19/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import UIKit
import CoreData

class FavoriteViewController: UIViewController {
    
    var selectedLeagues : Int?
    @IBOutlet weak var tableView: UITableView!
    
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
        
        
        //presenter.deleteObject(leaguesId: "test3")
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "favoriteLeagueDetails"{
            if let destination = segue.destination as? LeagueDetailsViewController{
                
                destination.leaguesId =  self.presenter.favorites[selectedLeagues!].favoriteId ?? ""
            }
            
        }else if segue.identifier == "favoriteWebView"{
            if let destination = segue.destination as? WebViewController{
                
                destination.leaguesWebURl =  self.presenter.favorites[selectedLeagues!].favoriteYoutubeURL ?? ""
            }
        }
      
    }
    

}

extension FavoriteViewController: FavoriteListPresenterOutput {
    func upadteFavorite() {
        tableView.reloadData()
    }

}
