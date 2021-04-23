////
////  DatabaseSource.swift
////  Sports App
////
////  Created by Wesam on 4/22/21.
////  Copyright © 2021 mohamed youssef. All rights reserved.
////
//
//import Foundation
//import CoreData
//
//
//class DatabaseSource {
//    
//    lazy var moContext: NSManagedObjectContext = {
//          persistentContainer.viewContext
//      }()
//    
//    private lazy var persistentContainer: NSPersistentContainer = {
//        
//            let container = NSPersistentContainer(name: "Sports_App")
//            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//                if let error = error as NSError? {
//                 
//                    print("Unresolved error \(error), \(error.userInfo)")
//                }
//            })
//            #if DEBUG
//                print(container.persistentStoreCoordinator.persistentStores[0].url!.absoluteString)
//            #endif
//
//            return container
//        }()
//
//    
//        // MARK: - Core Data Saving support
//        func saveContext () {
//            let context = persistentContainer.viewContext
//            if context.hasChanges {
//                do {
//                    try context.save()
//                } catch {
//                   
//                    let nserror = error as NSError
//                    print("Unresolved error \(nserror), \(nserror.userInfo)")
//                }
//            }
//        }
//    
//}
