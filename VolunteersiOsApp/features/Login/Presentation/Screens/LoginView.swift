//
//  LoginView.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 04/02/25.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    @EnvironmentObject var router: Router
    @EnvironmentObject var authManager: AuthManager
    @EnvironmentObject var appConfig: AppConfig
    @StateObject private var retryController = DefaultRetryController()
    
    var body: some View {
        VStack {
            Text("Bem-vindo de volta")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 50)
            
            Text("Faça login para continuar")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 30)
            
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
            SecureField("Senha", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
            switch viewModel.state {
                
            case .idle:
                Button(action: {
                    guard retryController.isRetryEnabled else { return }
                    Task {
                        await viewModel.login()
                    }
                }) {
                    Text("Fazer Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            
            case .loading:
                ProgressView()
                    .padding()
                
            case .success:
                Text("Login realizado com sucesso!")
                    .foregroundColor(.green)
                    .padding()
                    .onAppear {
                        router.goToHome()
                    }
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
                    
                Button("Cancelar") {
                    Task {
                        viewModel.resetState
                    }
                }
                .buttonStyle(.bordered)
                .padding()
            }
            
            Spacer()
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .onAppear {
            Task {
                print("Router in LoginView: \(router)")
            }
        }
    }
}
