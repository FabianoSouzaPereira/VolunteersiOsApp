//
//  SettingsRemoteRepositoryImpl.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 13/02/25.
//

import Foundation

class SettingsRemoteRepositoryImpl : SettingsRemoteRepository {
    private let dataSource: SettingsRemoteDataSource
    
    init(dataSource: SettingsRemoteDataSource) {
        self.dataSource = dataSource
    }
    
    func getSettings() async throws -> [SettingsEntity] {
        return try await dataSource.getSettings()
    }
    
}
