//
//  LoginView.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 04/02/25.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject var authManager: AuthManager

    var body: some View {
        VStack {
            Text("Login Screen")
                .font(.largeTitle)
                .padding()

            Button("Fazer Login") {
                authManager.login()
                router.goToHome()
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}
