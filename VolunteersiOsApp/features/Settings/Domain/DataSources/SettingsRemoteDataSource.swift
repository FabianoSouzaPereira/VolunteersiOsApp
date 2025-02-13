//
//  SettingsRemoteDatasource.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 13/02/25.
//

import Foundation

protocol SettingsRemoteDataSource {
    func getSettings() async throws -> [SettingsModel]
}
