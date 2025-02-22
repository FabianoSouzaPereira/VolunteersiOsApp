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
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .loading:
                    ProgressView()
                
            case .success(let data):
                Text("Bem-vindo, \(data[0].username)")
                    .font(.largeTitle)
                    .padding()
                Button("Ir para Configurações") {
                    router.goToSettings()
                }
                .buttonStyle(.bordered)
                
                Button("Logout") {
                    viewModel.handleAction(HomeAction.logout)
                }
                .buttonStyle(.bordered)
            case .error(let error):
                    Text(error.message)
                        .foregroundColor(.red)
                        .padding()
                    Button("Tentar novamente") {
                        Task {
                            await (error.retryAction ?? { @MainActor in router.goToLogin() })()
                        }
                    }
                    .buttonStyle(.bordered)
                    .padding()
                    
            case .idle:
                Text("Idle state").foregroundColor(.blue)
                    
            case .unknown: 
                Text("Unknown state").foregroundColor(.blue)
                    
            }
        }
        .onAppear {
            Task {
                print("Router in HomeView: \(router)")
                await viewModel.loadHomeData()
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu {
                    Button(action: { router.goToSettings() }) {
                        Label("Settings", systemImage: "gearshape")
                    }
//                    Button(action: { router.goToUserProfile() }) {
//                        Label("User", systemImage: "person.circle")
//                    }
//                    Button(action: { router.goToAbout() }) {
//                        Label("About", systemImage: "info.circle")
//                    }
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .imageScale(.large)
                }
            }
        }
    }
}
