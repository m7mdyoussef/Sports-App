//
//  TeamProtocols.swift
//  Sports App
//
//  Created by Wesam on 4/24/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import Foundation

protocol ITeamPresenter {
    init(view : ITeamView, teamId: String?)
    var teams : [TeamDetail]?{get set}
    var error : String?{get set}
    func getTeams()
}

protocol ITeamView : class{
    func reloadTeams()
    func startAnimating()
    func stopAnimating()
    func errorMessage()
}
