//
//  UserAddressModel.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 16/02/25.
//

import Foundation

struct UserAddressModel: UserAddressEntity, Decodable, Encodable {
    var street: String
    var number: String
    var city: String
    var state: String
    var country: String
    var zipCode: String
}
