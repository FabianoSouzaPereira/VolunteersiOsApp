//
//  VolunteersiOsAppApp.swift
//  VolunteersiOsApp
//
//  # Use of already resolved instances
//      Now we use router and appConfig directly in .environmentObject(),
//      avoiding unnecessarily resolving multiple instances.
//
//  # Addition of appConfig in environmentObject
//    If it is used in any View, it will now be available.
//
//  # Resolution of viewModels in advance
//     Now HomeViewModel and LoginViewModel are resolved outside the switch,
//     avoiding multiple calls to diContainer.resolve().
//     This improves performance and keeps the code cleaner.
//
//  Created by Fabiano Pereira on 04/02/25.
//

import SwiftUI
import FirebaseCore

@main
struct VolunteersiOsApp: App {
    private let diContainer = AppModule.shared
    @StateObject private var router: Router
    @StateObject private var appConfig: AppConfig

    init() {
        FirebaseApp.configure()
        let resolvedRouter: Router = diContainer.resolve(Router.self)
        let resolvedAppConfig: AppConfig = diContainer.resolve(AppConfig.self)
        
        _router = StateObject(wrappedValue: resolvedRouter)
        _appConfig = StateObject(wrappedValue: resolvedAppConfig)
    }

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                let homeViewModel = diContainer.resolve(HomeViewModel.self)
                let loginViewModel = diContainer.resolve(LoginViewModel.self)
                let settingsViewModel = diContainer.resolve(SettingsViewModel.self)

                SplashScreenView()
                    .environmentObject(router)
                    .environmentObject(appConfig)
                    .environmentObject(diContainer.resolve(AuthManager.self))
                    .navigationDestination(for: Screen.self) { screen in
                        switch screen {
                            case .splash:
                                    SplashScreenView()
                                        .environmentObject(router)
                                        .environmentObject(appConfig)
                                        .environmentObject(diContainer.resolve(AuthManager.self))
                            case .home:
                                    HomeView(viewModel: homeViewModel, loginViewModel: loginViewModel)
                                        .environmentObject(router)
                                        .environmentObject(appConfig)
                                        .environmentObject(diContainer.resolve(AuthManager.self))
                                        .navigationBarBackButtonHidden(true)
                            case .login:
                                LoginView(viewModel: loginViewModel)
                                        .environmentObject(router)
                                        .environmentObject(appConfig)
                                        .environmentObject(diContainer.resolve(AuthManager.self))
                            case .settings:
                                SettingsView(viewModel: settingsViewModel)
                                        .environmentObject(router)
                                        .environmentObject(appConfig)
                                        .environmentObject(diContainer.resolve(AuthManager.self))
                            case .loginerror:
                                LoginErrorView(error: LoginError.init(
                                    message: "", 
                                    retryAction: { (); }
                                ))
                        }
                    }
            }
        }
    }
}
