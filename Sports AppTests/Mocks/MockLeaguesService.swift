//
//  MockLeaguesService.swift
//  Sports AppTests
//
//  Created by Wesam on 4/27/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import Foundation
@testable import Sports_App

class MockLeaguesService{
    var shouldReturnError:Bool!
    
    init(shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError
    }
    
    var error:Error!
    
    var leaguesJSONResponse : [String:[[String:Any]]] = [
    "countrys":  [
        [
                "idLeague": "4617",
                "strLeague": "Albanian Superliga",
                "strSport": "Soccer",
                "strBadge": "https://www.thesportsdb.com/images/media/league/badge/qcikbi1614343801.png",
                "strYoutube" : "",
        ],
        [
            "idLeague": "4908",
            "strLeague": "Australian A-League",
            "strSport": "Soccer",
            "strBadge": "https://www.thesportsdb.com/images/media/league/badge/qcikbi1614343801.png",
            "strYoutube" : "",
        ]
    ]]
    
    enum ErrorHandler : Error {
        case returnError
    }
}

extension MockLeaguesService: LeagueProtocol{
    
    func getResponses<T: Decodable>(url: String, id: String = "" ,completion: @escaping(T?, Error?) ->Void){
        var leagues:Leagues
        do{
            let jsonData = try JSONSerialization.data(withJSONObject: leaguesJSONResponse, options: .fragmentsAllowed)
             leagues = try JSONDecoder().decode(Leagues.self, from: jsonData)
            
            if shouldReturnError{
                completion(nil,ErrorHandler.returnError)
            }else{
                completion(leagues as? T,nil)
            }

        }catch let error{
            print(error.localizedDescription)
        }
        
    }

    
    
}
