//
//  FirestoreUserNotificationSettingsModel.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 19/02/25.
//

import Foundation

struct FirestoreUserNotificationSettingsModel : FirestoreUserNotificationSettingsEntity {
    var notificationMessage: String
    
    init?(document: [String: Any]) {
        guard let notificationMessage = document["notificationMessage"] as? String else { return nil }
        self.notificationMessage = notificationMessage
    }
    
    func toDictionary() -> [String: Any] {
        return [
            "notificationMessage": notificationMessage
        ]
    }
}
