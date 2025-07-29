//
//  FirestoreUserPhonesModel.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 19/02/25.
//

import Foundation

struct FirestoreUserPhonesModel: FirestoreUserPhonesEntity, Codable {
    var mobile: String
    var home: String?
    var work: String?
    var hasErrors: Bool
}

