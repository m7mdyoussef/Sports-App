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
        
//        let data = League(leaguesId: "test", leaguesName: "test", leaguesImage: "test", youtube: "test", sportName: "test")
//        
//        presenter.didTapInsertAction(league: data)
        
    }
    

}

extension FavoriteViewController: FavoriteListPresenterOutput {
    func upadteFavorite() {
        tableView.reloadData()
    }

}
