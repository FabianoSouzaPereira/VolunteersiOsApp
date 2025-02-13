//
//  LoginRemoteRepository.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 12/02/25.
//

import Foundation

protocol LoginRemoteRepository {
    func login() async throws -> [LoginEntity]
}
