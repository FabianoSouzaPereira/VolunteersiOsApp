//
//  FirestoreUserAddressModel.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 19/02/25.
//

import Foundation

struct FirestoreUserAddressModel : FirestoreUserAddressEntity, Codable {
    var street: String
    var number: String
    var city: String
    var state: String
    var country: String
    var zipCode: String
}
