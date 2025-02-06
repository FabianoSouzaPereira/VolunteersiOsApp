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
        
        container.register(LoginRepository.self) { resolver in
            LoginRepositoryImpl(dataSource: resolver.resolve(LoginRemoteDataSource.self)!)
        }.inObjectScope(.container)
        
        container.register(LoginUseCase.self) { resolver in
            LoginUseCase(repository: resolver.resolve(LoginRepository.self)!)
        }.inObjectScope(.container)
        
        container.register(LoginViewModel.self) { resolver in
            LoginViewModel(LoginUseCase: resolver.resolve(LoginUseCase.self)!)
        }.inObjectScope(.transient)
    }
}
