//
//  FavoriteListModel.swift
//  Sports App
//
//  Created by Wesam on 4/22/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import Foundation

import CoreData

protocol FavoriteListModelInput {
    func fetchAllFavorite(completion: @escaping ([Favorite]?) -> ())
    func insertFavorite(league: League)
}

final class FavoriteListModel: FavoriteListModelInput {
    private let moContext: NSManagedObjectContext

    init(moContext: NSManagedObjectContext) {
        self.moContext = moContext
    }

    func fetchAllFavorite(completion: @escaping ([Favorite]?) -> ()) {
        let request = NSFetchRequest<Favorite>(entityName: "Favorite")
        
        request.sortDescriptors = [
                   NSSortDescriptor(keyPath: \Favorite.favoriteId, ascending: true)
               ]

        if let leagues = try? moContext.fetch(request) {
            completion(leagues)
        } else {
            completion(nil)
        }
    }

    func insertFavorite(league: League) {
        let favorite = NSEntityDescription.insertNewObject(forEntityName: "Favorite", into: moContext) as! Favorite
        
        favorite.favoriteId = league.leaguesId
        favorite.favoritName = league.leaguesName
        favorite.favoriteImage = league.leaguesImage
        favorite.favoriteYoutubeURL = league.youtube
        
        if moContext.hasChanges {
            do {
                try moContext.save()
            } catch let error as NSError {
                print("Core Data Error: \(error), \(error.userInfo)")
            }
        }
    }
    
    func deleteObject(leagueId: String, completion: @escaping ([Favorite]?) -> ()) {
        let request = NSFetchRequest<Favorite>(entityName: "Favorite")
        
        request.sortDescriptors = [
                   NSSortDescriptor(keyPath: \Favorite.favoriteId, ascending: true)
               ]

        if let leagues = try? moContext.fetch(request) {
            for item in leagues{
                print("\(item.favoriteId)\(leagueId)")
                if item.favoriteId == leagueId{
                    moContext.delete(item)
                    //completion(leagues)
                }
            }
            print("\(leagues)")
        } else {
            print("fail")
            completion(nil)
        }
        
        //if moContext.hasChanges {
            do {
                print(leagueId)
                try moContext.save()
            fetchAllFavorite { favorite in
               completion(favorite)
              }
            } catch let error as NSError {
                print("Core Data Error: \(error), \(error.userInfo)")
            }
        //}
       
    }
}
