//
//  FirestoreUserSocialMediaEntity.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 19/02/25.
//

import Foundation

protocol FirestoreUserSocialMediaEntity {
    var twitter: String? { get }
    var facebook: String? { get }
    var instagram: String? { get }
    var linkedin: String? { get }
}
