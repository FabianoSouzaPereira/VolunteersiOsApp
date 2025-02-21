//
//  SplashScreenView.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 05/02/25.
//

import SwiftUI

struct SplashScreenView: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject var authManager: AuthManager
    @EnvironmentObject var appConfig: AppConfig

    var body: some View {
        VStack {
            Text("VolunteersiOs")
                .font(.largeTitle)
                .bold()
                .padding()

            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
        }
        .onAppear {
            print("Router in SplashScreenView: \(router)")
            if authManager.isAuthenticated {
                router.goToHome()
            } else {
                router.goToLogin()
            }
        }
    }
}
