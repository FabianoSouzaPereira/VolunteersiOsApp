//
//  UserPhones.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 16/02/25.
//

import Foundation

protocol UserPhonesEntity {
    var mobile: String { get }
    var home: String? { get }
    var work: String? { get }
}
