//
//  LoginRemoteRepositoryImpl.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 12/02/25.
//

import Foundation

class LoginRemoteRepositoryImpl : LoginRemoteRepository {
    private let dataSource: LoginRemoteDataSource
    
    init(dataSource: LoginRemoteDataSource) {
        self.dataSource = dataSource
    }
    

    func login(email: String, password: String) async throws -> LoginEntity {
        return try await dataSource.login(email: email, password: password)
    }
    
}
