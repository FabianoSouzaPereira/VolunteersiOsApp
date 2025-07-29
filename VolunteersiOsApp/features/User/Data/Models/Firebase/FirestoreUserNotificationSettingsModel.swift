//
//  FirestoreUserNotificationSettingsModel.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 19/02/25.
//

import Foundation

struct FirestoreUserNotificationSettingsModel : FirestoreUserNotificationSettingsEntity, Codable {
    var notificationMessage: String
}
