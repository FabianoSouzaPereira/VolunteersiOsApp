//
//  AuthManager.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 05/02/25.
//

import Foundation
import SwiftUI

class AuthManager: ObservableObject {
    @Published var isAuthenticated: Bool = false

    init() {
        checkLoginStatus()
    }

    func checkLoginStatus() {
        // Simulação: busca do UserDefaults (ou Keychain, API, etc.)
        let savedToken = TokenManager.shared.getToken()
        isAuthenticated = savedToken != nil
    }

    func login() {
        isAuthenticated = true
    }

    func logout() {
        TokenManager.shared.removeToken()
        isAuthenticated = false
    }
}
