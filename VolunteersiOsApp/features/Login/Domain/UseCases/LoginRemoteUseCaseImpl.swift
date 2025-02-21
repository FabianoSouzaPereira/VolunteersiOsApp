//
//  LoginUseCaseImpl.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 12/02/25.
//

import Foundation

final class LoginRemoteUseCaseImpl: LoginRemoteUseCase {
    private let repository: LoginRemoteRepository
    private let errorHandler: ErrorHandler
    
    init(repository: LoginRemoteRepository, errorHandler: ErrorHandler) {
        self.repository = repository
        self.errorHandler = errorHandler
    }
    
    func login(email: String, password: String) async throws -> LoginEntity {
        do {
            let loginEntity = try await repository.login(email: email, password: password)
            return loginEntity
            
        } catch let errorHandler as RequestError {
            throw errorHandler
        } catch {
            throw GeneralRequestError.serverError
        }
    }
}
