//
//  SettingsState.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 04/02/25.
//

import Foundation


struct SettingsData {
    let username: String
    let lastSettings: Date
    let notifications: Int

    static let empty = SettingsData(username: "", lastSettings: Date(), notifications: 0)
}

enum SettingsState {
    case idle
    case loading
    case success(data: [SettingsEntity])
    case error(SettingsError)
}

struct SettingsError: Identifiable {
    let id = UUID()
    let message: String
    let retryAction: (@MainActor () async -> Void)?
}


enum SettingsAction {
    case refresh
    case logout
    case goToHome
    case goToSettings
}


extension SettingsState {
    static var initial: SettingsState {
        return .loading
    }
}

