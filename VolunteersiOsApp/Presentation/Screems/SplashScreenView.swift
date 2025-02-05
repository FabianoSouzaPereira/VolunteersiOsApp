//
//  SplashScreenView.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 05/02/25.
//

import SwiftUI

struct SplashScreenView: View {
    @EnvironmentObject var authManager: AuthManager
    @EnvironmentObject var router: Router

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
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                if authManager.isAuthenticated {
                    router.goToHome()
                } else {
                    router.goToLogin()
                }
            }
        }
    }
}

