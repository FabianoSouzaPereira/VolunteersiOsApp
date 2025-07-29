//
//  SettingsEntity.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 13/02/25.
//

import Foundation

protocol SettingsEntity {
    associatedtype ServerAddressType: ServerAddressEntity
    
    var id: Int64 { get }
    var maintenanceMode: Bool { get }
    var defaultLanguage: String { get }
    var privacyPolicyURL: String { get }
    var termsOfServiceURL: String { get }
    var appVersion: String { get }
    var featureToggle: Bool { get }
    var serverAddress: ServerAddressType { get }
    var supportContactEmail: String { get }
    var defaultTimezone: String { get }
    var maxUploadSize: Int64 { get }
    var analyticsEnabled: Bool { get }
    var chatEnabled: Bool { get }
    var darkMode: Bool { get }
}




