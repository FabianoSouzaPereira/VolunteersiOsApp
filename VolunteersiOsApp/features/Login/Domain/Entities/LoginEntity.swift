//
//  LoginEntity.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 12/02/25.
//

import Foundation

protocol LoginEntity {
    var id: String { get }
    var username: String { get }
    var lastLogin: Date { get }
    var notifications: Int { get }
    var token: String { get }
}
