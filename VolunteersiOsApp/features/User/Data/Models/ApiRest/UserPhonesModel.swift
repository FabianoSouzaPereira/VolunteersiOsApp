//
//  UserPhonesModel.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 16/02/25.
//

import Foundation

struct UserPhonesModel: UserPhonesEntity, Decodable, Encodable {
    var mobile: String
    var home: String?
    var work: String?
}
