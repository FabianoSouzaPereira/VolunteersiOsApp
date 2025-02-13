//
//  SettingsUseCaseImpl.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 13/02/25.
//

import Foundation

class SettingsRemoteUseCaseImpl : SettingsRemoteUseCase {
    private var repository: SettingsRemoteRepository
    
    init(repository: SettingsRemoteRepository) {
        self.repository = repository
    }
    
    func getSettings() async throws -> [SettingsEntity] {
        return try await repository.getSettings()
    }

}
