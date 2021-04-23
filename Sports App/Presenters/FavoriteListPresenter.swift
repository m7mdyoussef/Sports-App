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
    var model: FavoriteListModel

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
        }
    }
    
    func deleteObject(leaguesId: String) {
        print(leaguesId)
        model.deleteObject(leagueId: leaguesId, completion: {
            [weak self] favorite in
                       self?.favorites = favorite ?? []
            if ((self?.favorites.count) == nil) {
                print("can not show data")
                self?.view.showEmptyListImage()
            }else{
                 print("hide empty image")
                self?.view.hideEmptyListImage()
            }
            self?.view.upadteFavorite()
        })
    }


}
