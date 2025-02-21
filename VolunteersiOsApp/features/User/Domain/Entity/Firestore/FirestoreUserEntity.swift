//
//  FirestoreUserEntity.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 19/02/25.
//

import Foundation

protocol FirestoreUserEntity {
    associatedtype AddressType: FirestoreUserAddressEntity
    associatedtype PhonesType: FirestoreUserPhonesEntity
    associatedtype SocialMediaType: FirestoreUserSocialMediaEntity
    associatedtype NotificationSettingsType: FirestoreUserNotificationSettingsEntity
    
    var id: String { get }
    var profilePicture: URL? { get }
    var email: String { get }
    var username: String { get }
    var address: AddressType { get }
    var phones: PhonesType { get }
    var socialmedia: SocialMediaType { get }
    var notificationSettings: NotificationSettingsType { get }
    var lastLogin: Date { get }
    var isActive: Bool { get }
    var createdAt: Date { get }
}
