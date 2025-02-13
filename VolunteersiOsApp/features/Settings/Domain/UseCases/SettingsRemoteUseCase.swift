//
//  SettingsUseCase.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 06/02/25.
//

import Foundation

protocol SettingsRemoteUseCase {
    func getSettings() async throws -> [SettingsEntity]
}
