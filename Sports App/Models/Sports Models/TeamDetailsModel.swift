//
//  TeamDetailsModel.swift
//  Sports App
//
//  Created by Wesam on 4/24/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import Foundation

struct TeamsDetails : Codable {
    
    let teams : [TeamDetail]?

    enum CodingKeys: String, CodingKey {

        case teams = "teams"
    }
}

struct TeamDetail : Codable {
    
    let teamName : String?
    let leaguesName : String?
    let description : String?
    let country : String?
    let twitter: String?
    let facebook: String?
    let instagram: String?
    let badge: String?
    let stadiumImage: String?
    let stadium: String?
    

    enum CodingKeys: String, CodingKey {

        case teamName = "strTeam"
        case leaguesName = "strLeague"
        case description = "strDescriptionEN"
        case country = "strCountry"
        case twitter = "strTwitter"
        case facebook = "strFacebook"
        case instagram = "strInstagram"
        case badge = "strTeamBadge"
        case stadiumImage = "strStadiumThumb"
        case stadium = "strStadium"
        
        
    }
    
    
    
}














