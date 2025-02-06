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
        let savedToken = UserDefaults.standard.string(forKey: "user_token")
        isAuthenticated = savedToken != nil
    }

    func login() {
        UserDefaults.standard.set("dummy_token", forKey: "user_token")
        isAuthenticated = true
    }

    func logout() {
        UserDefaults.standard.removeObject(forKey: "user_token")
        isAuthenticated = false
    }
}
