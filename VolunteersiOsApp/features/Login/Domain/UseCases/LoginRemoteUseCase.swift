//
//  LoginUseCase.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 12/02/25.
//

import Foundation

protocol LoginRemoteUseCase {
    func login() async throws -> [LoginEntity]
}
