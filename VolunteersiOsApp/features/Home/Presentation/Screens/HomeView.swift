//
//  HomeView.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 04/02/25.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    @ObservedObject var loginViewModel: LoginViewModel
    @EnvironmentObject var router: Router
    @EnvironmentObject var authManager: AuthManager
    @EnvironmentObject var appConfig: AppConfig
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .success(let data):
                Text("Bem-vindo, \(data[0].username)")
                    .font(.largeTitle)
                    .padding()
            case .error(let message):
                Text("Erro: \(message)").foregroundColor(.red)
            case .idle:
                Text("Idle state").foregroundColor(.blue)
            }

            Button("Ir para Configurações") {
                router.goToSettings()
            }
            .buttonStyle(.bordered)
            
            Button("Logout") {
                viewModel.handleAction(HomeAction.logout)
            }
            .buttonStyle(.bordered)
        }
        .onAppear {
            Task {
                print("Router in HomeView: \(router)")
                await viewModel.loadHomeData()
            }
        }
    }
}
