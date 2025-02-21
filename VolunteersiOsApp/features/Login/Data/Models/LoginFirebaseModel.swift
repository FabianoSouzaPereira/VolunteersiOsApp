//
//  LoginFirebaseModel.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 21/02/25.
//

import Foundation

struct LoginFirebaseModel : LoginEntity {
    let id: String
    let username: String
    let lastLogin: Date
    let notifications: Int
    let token: String
    
    static let empty = LoginData(username: "", lastLogin: Date(), notifications: 0)
}
