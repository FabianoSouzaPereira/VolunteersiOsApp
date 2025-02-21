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

struct FirestoreUserModel: FirestoreUserEntity {
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
    
    init?(document: [String: Any]) {
        self.id = document["id"] as? String ?? ""
        self.profilePicture = (document["profilePicture"] as? String).flatMap { URL(string: $0) }
        self.email = document["email"] as? String ?? ""
        self.username = document["username"] as? String ?? ""
        
        let addressData = document["address"] as? [String: Any] ?? [:]
        self.address = FirestoreUserAddressModel(document: addressData)
        
        let phonesData = document["phones"] as? [String: Any] ?? [:]
        self.phones = FirestoreUserPhonesModel(document: phonesData)
        
        let socialmediaData = document["socialmedia"] as? [String: Any] ?? [:]
        self.socialmedia = FirestoreUserSocialMediaModel(document: socialmediaData)!
        
        let notificationSettingsData = document["notificationSettings"] as? [String: Any] ?? [:]
        self.notificationSettings = FirestoreUserNotificationSettingsModel(document: notificationSettingsData)!
        
        self.lastLogin = (document["lastLogin"] as? Timestamp)?.dateValue() ?? Date()
        self.isActive = document["isActive"] as? Bool ?? false
        self.createdAt = (document["createdAt"] as? Timestamp)?.dateValue() ?? Date()
    }
}
