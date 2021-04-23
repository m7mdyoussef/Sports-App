//
//  LeaguesModel.swift
//  Sports App
//
//  Created by Wesam on 4/22/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import Foundation

struct Leagues : Codable {
    
    let leagues : [League]?

    enum CodingKeys: String, CodingKey {

        case leagues = "countrys"
    }
}

struct League : Codable {
    
    let leaguesId : String?
    let leaguesName : String?
    let sportName : String?
    let leaguesImage : String?
    let youtube: String?
    
    
    init(leaguesId: String, leaguesName: String, leaguesImage:String, youtube: String, sportName: String) {
        
        self.leaguesId = leaguesId
        self.leaguesName = leaguesName
        self.leaguesImage = leaguesImage
        self.youtube = youtube
        self.sportName = sportName
        
    }

    

    enum CodingKeys: String, CodingKey {

        case leaguesId = "idLeague"
        case leaguesName = "strLeague"
        case sportName = "strSport"
        case leaguesImage = "strBadge"
        case youtube = "strYoutube"
    }
}


