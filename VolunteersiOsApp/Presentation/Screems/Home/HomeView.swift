//
//  HomeView.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 04/02/25.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject var authManager: AuthManager

    var body: some View {
        VStack {
            Text("Home Screen")
                .font(.largeTitle)
                .padding()

            Button("Ir para Configurações") {
                router.goToSettings()
            }
            .buttonStyle(.bordered)
            .padding()

            Button("Sair") {
                authManager.logout()
                router.goToLogin()
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

