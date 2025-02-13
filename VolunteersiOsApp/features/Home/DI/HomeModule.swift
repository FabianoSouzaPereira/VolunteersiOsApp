//
//  DataModule.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 04/02/25.
//

import Swinject

class HomeModule {
    static func register(in container: Container) {
        container.register(HomeRemoteDataSource.self) { _ in
            HomeRemoteDataSourceImpl()
        }.inObjectScope(.container)
        
        container.register(HomeRemoteRepository.self) { resolver in
            HomeRemoteRepositoryImpl(remoteDataSource: resolver.resolve(HomeRemoteDataSource.self)!)
        }.inObjectScope(.container)
        
        container.register(HomeUseCase.self) { resolver in
            HomeUseCaseImpl(repository: resolver.resolve(HomeRemoteRepository.self)!)
        }.inObjectScope(.container)
        
        container.register(HomeViewModel.self) { resolver in
            HomeViewModel(homeUseCase: resolver.resolve(HomeUseCase.self)!)
        }.inObjectScope(.transient)
    }
}
