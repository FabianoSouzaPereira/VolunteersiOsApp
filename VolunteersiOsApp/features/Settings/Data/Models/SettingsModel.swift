//
//  SettingsModel.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 13/02/25.
//

import Foundation

struct SettingsModel: SettingsEntity, Codable {
    let id: Int64
    let maintenanceMode: Bool
    let defaultLanguage: String
    let privacyPolicyURL: String
    let termsOfServiceURL: String
    let appVersion: String
    let featureToggle: Bool
    let serverAddress: ServerAddressModel
    let supportContactEmail: String
    let defaultTimezone: String
    let maxUploadSize: Int64
    let analyticsEnabled: Bool
    let chatEnabled: Bool
    let darkMode: Bool
}
