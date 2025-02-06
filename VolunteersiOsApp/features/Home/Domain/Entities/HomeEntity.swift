//
//  HomeEntity.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 06/02/25.
//

import Foundation

protocol HomeEntity {
    var username: String { get }
    var lastLogin: Date { get }
    var notifications: Int { get }
}
