//
//  FirestoreUserPhonesEntity.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 19/02/25.
//

import Foundation

protocol FirestoreUserPhonesEntity {
    var mobile: String { get }
    var home: String? { get }
    var work: String? { get }
}
