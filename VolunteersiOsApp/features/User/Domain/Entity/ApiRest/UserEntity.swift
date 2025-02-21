//
//  UserEntity.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 16/02/25.
//

import Foundation

/**
 Encodable and Decodable (i.e. Codable) do not work directly with protocols with any, as the Swift compiler cannot automatically infer how to serialize and deserialize these properties that use any.
 A possible approach is to turn UserEntity into a generic protocol, removing any protocols and ensuring that UserModel uses specific types for its properties.
 This way, Swift knows exactly which types will be used and can generate the Codable methods correctly.

 - Parameter type associatedtype AddressType
 - Parameter type associatedtype PhonesType
 - Parameter type associatedtype SocialMediaType
 - Parameter type associatedtype NotificationSettingsType
 - Returns: Entity
 */
protocol UserEntity {
    associatedtype AddressType: UserAddressEntity
    associatedtype PhonesType: UserPhonesEntity
    associatedtype SocialMediaType: UserSocialMediaEntity
    associatedtype NotificationSettingsType: UserNotificationSettingsEntity

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

