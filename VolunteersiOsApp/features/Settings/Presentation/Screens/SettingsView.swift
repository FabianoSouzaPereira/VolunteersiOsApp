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
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            switch viewModel.state {
                case .loading:
                    ProgressView()
                case .success(let data):
                    Text("Configurações")
                        .font(.largeTitle)
                        .padding()
                    
                    Button("Voltar para Home") {
                        router.goToHome()
                    }
                    .buttonStyle(.bordered)
                case .error(let error):
                    Text(error.message)
                        .foregroundColor(.red)
                        .padding()
                    Button("Tentar novamente") {
                        Task {
                            await (error.retryAction ?? { @MainActor in router.goToSettings() })()
                        }
                    }
                    .buttonStyle(.bordered)
                    .padding()
                case .idle:
                    Text("Idle state").foregroundColor(.blue)
            }
        }            
        .onAppear {
            Task {
                print("Router in SettingsView: \(router)")
                await viewModel.getSettings()
            }
        }        
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    viewModel.handleAction(SettingsAction.goToHome)
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                }
            }
        }
    }
}
