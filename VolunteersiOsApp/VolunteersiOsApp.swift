//
//  VolunteersiOsAppApp.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 04/02/25.
//

import SwiftUI

@main
struct VolunteersiOsApp: App {
    private let diContainer = AppModule.shared

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $diContainer.resolve(Router.self).path) {
                SplashScreenView()
                    .environmentObject(diContainer.resolve(Router.self))
                    .environmentObject(diContainer.resolve(AuthManager.self))
                    .navigationDestination(for: Screen.self) { screen in
                        switch screen {
                        case .splash:
                            SplashScreenView()
                        case .home:
                            HomeView(viewModel: diContainer.resolve(HomeViewModel.self))
                        case .login:
                            LoginView()
                        case .settings:
                            SettingsView()
                        }
                    }
            }
        }
    }
}
