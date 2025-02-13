//
//  SettingsRemoteRepositoryImpl.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 13/02/25.
//

import Foundation

class SettingsRemoteRepositoryImpl : SettingsRemoteRepository {
    private let dataSource: SettingsRemoteDatasource
    
    init(dataSource: SettingsRemoteDatasource) {
        self.dataSource = dataSource
    }
    
    func getSettings() async throws -> [SettingsEntity] {
        return try await dataSource.getSettings()
    }
    
}
