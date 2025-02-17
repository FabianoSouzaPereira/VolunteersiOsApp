//
//  UserSocialMediaModel.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 16/02/25.
//

import Foundation

struct UserSocialMediaModel: UserSocialMediaEntity, Decodable, Encodable {
    var twitter: String?
    var facebook: String?
    var instagram: String?
    var linkedin: String?
}
