//
//  FirestoreUserModel.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 17/02/25.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

struct FirestoreUserModel: FirestoreUserEntity, Codable {
    var id: String
    var profilePicture: URL?
    var email: String
    var username: String
    var address: FirestoreUserAddressModel
    var phones: FirestoreUserPhonesModel
    var socialmedia: FirestoreUserSocialMediaModel
    var notificationSettings: FirestoreUserNotificationSettingsModel
    var lastLogin: Date
    var isActive: Bool
    var createdAt: Date
}
