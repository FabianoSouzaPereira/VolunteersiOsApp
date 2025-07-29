//
//  FirestoreUserSocialMediaModel.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 19/02/25.
//

import Foundation

struct FirestoreUserSocialMediaModel : FirestoreUserSocialMediaEntity, Codable {
    var twitter: String?
    var facebook: String?
    var instagram: String?
    var linkedin: String?
}
