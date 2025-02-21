//
//  LoginRemoteRepositoryImpl.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 12/02/25.
//

import Foundation

class LoginRemoteRepositoryImpl: LoginRemoteRepository {
    private let appConfig: AppConfig
    private let loginRemoteDataSource: LoginRemoteDataSource
    private let loginFirebaseDataSource: LoginFirebaseDataSource
    private let errorHandler: ErrorHandler
    
    init(
        loginRemoteDataSource: LoginRemoteDataSource,
        loginFirebaseDataSource: LoginFirebaseDataSource,
        errorHandler: ErrorHandler, appConfig: AppConfig
    ) {
        self.loginRemoteDataSource = loginRemoteDataSource
        self.loginFirebaseDataSource = loginFirebaseDataSource
        self.errorHandler = errorHandler
        self.appConfig = appConfig
    }
    
    func login(email: String, password: String) async throws -> LoginEntity {
        let isUsingFirebase = appConfig.isUsingFirebaseState
        let loginEntity: LoginEntity
        
        do {

            if isUsingFirebase {
                loginEntity = try await loginFirebaseDataSource.login(email: email, password: password)
            } else {
                loginEntity = try await loginRemoteDataSource.login(email: email, password: password)
            }
            
            return loginEntity
        } catch let error as RequestError {
            throw error
        } catch {
            throw GeneralRequestError.serverError
        }
    }
}

