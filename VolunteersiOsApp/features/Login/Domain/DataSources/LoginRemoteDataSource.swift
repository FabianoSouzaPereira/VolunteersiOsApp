//
//  LoginDataSource.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 12/02/25.
//

import Foundation

protocol LoginRemoteDataSource {
    func login(email: String, password: String) async throws -> LoginModel
}
