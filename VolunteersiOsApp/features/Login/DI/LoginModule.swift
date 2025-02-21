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
        container.register(ErrorHandler.self) { _ in
            ErrorHandler()
        }.inObjectScope(.container)
        
        container.register(LoginRemoteDataSource.self) { _ in
            LoginRemoteDataSourceImpl()
        }.inObjectScope(.container)
        
        container.register(LoginFirebaseDataSource.self) { resolver in
            LoginFirebaseDataSourceImpl(
                auth: resolver.resolve(Auth.self)!,
                firestore: resolver.resolve(Firestore.self)!
            )
        }.inObjectScope(.container)
        
        container.register(LoginRemoteRepository.self) { resolver in
            LoginRemoteRepositoryImpl(
                loginRemoteDataSource: resolver.resolve(LoginRemoteDataSource.self)!,
                loginFirebaseDataSource: resolver.resolve(LoginFirebaseDataSource.self)!,
                errorHandler: resolver.resolve(ErrorHandler.self)!,
                appConfig:resolver.resolve(AppConfig.self)!
            )
        }.inObjectScope(.container)
        
        container.register(LoginRemoteUseCase.self) { resolver in
            LoginRemoteUseCaseImpl(
                repository: resolver.resolve(LoginRemoteRepository.self)!,
                errorHandler: resolver.resolve(ErrorHandler.self)!
            )
        }.inObjectScope(.container)
        
        container.register(LoginViewModel.self) { resolver in
            let retryController = resolver.resolve((any RetryControllerProtocol).self)!
            return LoginViewModel(
                loginRemoteUseCase: resolver.resolve(LoginRemoteUseCase.self)!, 
                errorHandler: resolver.resolve(ErrorHandler.self)!,
                retryController: retryController
            )
        }.inObjectScope(.transient)
    }
}
