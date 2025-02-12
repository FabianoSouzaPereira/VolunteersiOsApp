//
//  HomeModel.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 06/02/25.
//

import Foundation

struct HomeModel: HomeEntity {
    let id: String
    let username: String
    let lastLogin: Date
    let notifications: Int
    
    static let empty = HomeData(username: "", lastLogin: Date(), notifications: 0)
}

