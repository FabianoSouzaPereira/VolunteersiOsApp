//
//  SettingsView.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 04/02/25.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel
    @EnvironmentObject var router: Router
    @EnvironmentObject var authManager: AuthManager
    @EnvironmentObject var appConfig: AppConfig
    
    var body: some View {
        VStack {
            Text("Configurações")
                .font(.largeTitle)
                .padding()
            
            Button("Voltar para Home") {
                router.goToHome()
            }
            .buttonStyle(.bordered)
            .onAppear {
                Task {
                    print("Router in SettingsView: \(router)")
                }
            }
        }
    }
}
