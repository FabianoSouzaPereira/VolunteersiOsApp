//
//  UserNotificationSettingsModel.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 16/02/25.
//

import Foundation

struct UserNotificationSettingsModel: UserNotificationSettingsEntity, Decodable, Encodable {
    var notificationMessage: String
}
