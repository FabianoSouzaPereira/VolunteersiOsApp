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
        
        container.register(SettingsRemoteRepository.self) { resolver in
            SettingsRemoteRepositoryImpl(dataSource: resolver.resolve(SettingsRemoteDataSource.self)!)
        }.inObjectScope(.container)
        
        container.register(SettingsRemoteUseCase.self) { resolver in
            SettingsRemoteUseCaseImpl(repository: resolver.resolve(SettingsRemoteRepository.self)!)
        }.inObjectScope(.container)
        
        container.register(SettingsViewModel.self) { resolver in
            SettingsViewModel(useCase: resolver.resolve(SettingsRemoteUseCase.self)!)
        }.inObjectScope(.transient)
    }
}
