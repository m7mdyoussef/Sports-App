//
//  FavoriteListPresenter.swift
//  Sports App
//
//  Created by Wesam on 4/22/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import Foundation
import CoreData

protocol FavoriteistPresenterInput {
    var numberOfFavorite: Int { get }
    func loadFavorite()
    func favorite(forRow: Int) -> Favorite?
    func didTapInsertAction(league: League)
    func deleteObject(leaguesId: String)
 
}

protocol FavoriteListPresenterOutput: AnyObject {
    func upadteFavorite()
    func showEmptyListImage()
    func hideEmptyListImage()
}

final class FavoriteListPresenter: FavoriteistPresenterInput {

    private(set) var favorites: [Favorite] = []

    private weak var view: FavoriteListPresenterOutput!
   // private(set) var model: FavoriteListModelInput
    var model: FavoriteListModel

//    init(view: FavoriteListPresenterOutput, model: FavoriteListModelInput) {
//        self.view = view
//        self.model = model
//    }
    

    required init(view: FavoriteListPresenterOutput, context: NSManagedObjectContext) {
        self.view = view
        self.model = FavoriteListModel(moContext: context)
    }

    
    var numberOfFavorite: Int{
        favorites.count
    }
    
    func favorite(forRow row: Int) -> Favorite? {
        guard row < favorites.count else { return nil }
               return favorites[row]
    }
    
    func didTapInsertAction(league: League) {
        model.insertFavorite(league: league)
        model.fetchAllFavorite { [weak self] favorites in
            self?.favorites = favorites ?? []
            self?.view.upadteFavorite()
        }
    }
    

    func loadFavorite() {
        model.fetchAllFavorite { [weak self] favorite in
                   self?.favorites = favorite ?? []
                   self?.view.upadteFavorite()
            
                   if ((self?.favorites.count) == nil) {
                       print("can show data")
                       self?.view.hideEmptyListImage()
                   }else{
                        print("show empty image")
                       self?.view.showEmptyListImage()
                   }
        }
    }
    
    func deleteObject(leaguesId: String) {
        print(leaguesId)
        model.deleteObject(leagueId: leaguesId, completion: {
            [weak self] favorite in
                       self?.favorites = favorite ?? []
                       self?.view.upadteFavorite()
        })
    }


}
