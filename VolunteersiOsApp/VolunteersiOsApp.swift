//
//  VolunteersiOsAppApp.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 04/02/25.
//

import SwiftUI

@main
struct VolunteersiOsApp: App {
    @StateObject private var router = Router()
    @StateObject private var authManager = AuthManager()

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                SplashScreenView()
                    .environmentObject(router)
                    .environmentObject(authManager)
                    .navigationDestination(for: Screen.self) { screen in
                        switch screen {
                        case .splash:
                            SplashScreenView()
                                .environmentObject(router)
                                .environmentObject(authManager)
                        case .home:
                            HomeView()
                                .environmentObject(router)
                                .environmentObject(authManager)
                        case .login:
                            LoginView()
                                .environmentObject(router)
                                .environmentObject(authManager)
                        case .settings:
                            SettingsView()
                                .environmentObject(router)
                                .environmentObject(authManager)
                        }
                    }
            }
        }
    }
}


