//
//  LeagueProtocol.swift
//  Sports App
//
//  Created by Wesam on 4/27/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import Foundation

protocol LeagueProtocol {
    func getResponses <T: Decodable>(url: String, id: String ,completion: @escaping(T?, Error?) ->Void)
}
