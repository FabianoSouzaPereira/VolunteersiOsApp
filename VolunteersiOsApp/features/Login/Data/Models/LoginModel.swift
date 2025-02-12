//
//  LoginModel.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 12/02/25.
//

import Foundation

struct LoginModel : LoginEntity {
    let id: String
    let username: String
    let lastLogin: Date
    let notifications: Int
    let token: String
    
    static let empty = LoginData(username: "", lastLogin: Date(), notifications: 0)
}
