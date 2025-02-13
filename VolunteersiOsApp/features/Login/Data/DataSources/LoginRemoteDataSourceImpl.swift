//
//  LoginRemoteDataSource.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 12/02/25.
//

import Foundation

class LoginRemoteDataSourceImpl: LoginRemoteDataSource {
    
    
    func login() async throws -> [LoginModel] {
        return [LoginModel(id: "100",username: "", lastLogin: Date(), notifications: 0, token: "")]
    }
    
}
