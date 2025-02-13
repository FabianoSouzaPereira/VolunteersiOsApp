//
//  LoginModule.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 06/02/25.
//

import Swinject

class LoginModule {
    static func register(in container: Container) {
        container.register(LoginRemoteDataSource.self) { _ in
            LoginRemoteDataSourceImpl()
        }.inObjectScope(.container)
        
        container.register(LoginRemoteRepository.self) { resolver in
            LoginRemoteRepositoryImpl(dataSource: resolver.resolve(LoginRemoteDataSource.self)!)
        }.inObjectScope(.container)
        
        container.register(LoginRemoteUseCase.self) { resolver in
            LoginRemoteUseCaseImpl(repository: resolver.resolve(LoginRemoteRepository.self)!)
        }.inObjectScope(.container)
        
        container.register(LoginViewModel.self) { resolver in
            LoginViewModel(loginRemoteUseCase: resolver.resolve(LoginRemoteUseCase.self)!)
        }.inObjectScope(.transient)
    }
}
