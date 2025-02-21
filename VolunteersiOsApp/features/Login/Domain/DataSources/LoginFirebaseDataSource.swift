//
//  LoginFirebaseDataSource.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 21/02/25.
//

import Foundation

protocol LoginFirebaseDataSource {
    func login(email: String, password: String) async throws -> LoginFirebaseModel
}
