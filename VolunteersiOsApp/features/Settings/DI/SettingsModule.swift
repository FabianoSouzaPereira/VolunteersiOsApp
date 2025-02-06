//
//  SettingsModule.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 06/02/25.
//

import Swinject

class SettingsModule {
    static func register(in container: Container) {
        container.register(SettingsRemoteDataSource.self) { _ in
            SettingsRemoteDataSourceImpl()
        }.inObjectScope(.container)
        
        container.register(SettingsRepository.self) { resolver in
            SettingsRepositoryImpl(dataSource: resolver.resolve(SettingsRemoteDataSource.self)!)
        }.inObjectScope(.container)
        
        container.register(SettingsUseCase.self) { resolver in
            SettingsUseCase(repository: resolver.resolve(SettingsRepository.self)!)
        }.inObjectScope(.container)
        
        container.register(SettingsViewModel.self) { resolver in
            SettingsViewModel(SettingsUseCase: resolver.resolve(SettingsUseCase.self)!)
        }.inObjectScope(.transient)
    }
}
