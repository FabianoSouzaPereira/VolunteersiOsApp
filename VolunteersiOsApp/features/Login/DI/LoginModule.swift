//
//  LoginModule.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 06/02/25.
//

import Swinject
import FirebaseAuth
import FirebaseFirestore

class LoginModule {
    static func register(in container: Container) {
        container.register(LoginRemoteDataSource.self) { _ in
            LoginRemoteDataSourceImpl()
        }.inObjectScope(.container)
        
        container.register(LoginRemoteDataSource.self) { resolver in
            LoginFirebaseDataSourceImpl(
                auth: resolver.resolve(Auth.self)!,
                firestore: resolver.resolve(Firestore.self)!
            )
        }
        
        container.register(LoginRemoteRepository.self) { resolver in
            LoginRemoteRepositoryImpl(dataSource: resolver.resolve(LoginRemoteDataSource.self)!)
        }.inObjectScope(.container)
        
        container.register(LoginRemoteUseCase.self) { resolver in
            LoginRemoteUseCaseImpl(repository: resolver.resolve(LoginRemoteRepository.self)!)
        }.inObjectScope(.container)
        
        container.register(LoginViewModel.self) { resolver in
            let retryController = resolver.resolve((any RetryControllerProtocol).self)!
            return LoginViewModel(loginRemoteUseCase: resolver.resolve(LoginRemoteUseCase.self)!, retryController: retryController)
        }.inObjectScope(.transient)
    }
}
