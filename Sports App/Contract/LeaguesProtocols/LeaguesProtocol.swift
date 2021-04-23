//
//  LeaguesProtocol.swift
//  Sports App
//
//  Created by Wesam on 4/22/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import Foundation

protocol ILeaguesPresenter {
    init(view : ILeaguesView, sportName: String?)
    var leagues : [League]?{get set}
    var error : String?{get set}
    func getLeagues()
}

protocol ILeaguesView : class{
    func reloadLeague()
    func startAnimating()
    func stopAnimating()
    func errorMessage()
}
