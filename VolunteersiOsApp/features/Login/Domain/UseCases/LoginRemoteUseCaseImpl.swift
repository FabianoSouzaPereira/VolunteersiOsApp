//
//  LoginUseCaseImpl.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 12/02/25.
//

import Foundation

final class LoginRemoteUseCaseImpl: LoginRemoteUseCase {
    private let repository: LoginRemoteRepository
    
    init(repository: LoginRemoteRepository) {
        self.repository = repository
    }
    
    func login(email: String, password: String) async throws -> LoginEntity {
        return try await repository.login(email: email, password: password)
    }
}
