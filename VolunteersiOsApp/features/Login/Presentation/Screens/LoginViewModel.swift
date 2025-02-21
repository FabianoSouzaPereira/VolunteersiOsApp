//
//  LoginViewModel.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 04/02/25.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var email: String = "jeovajire2003@gmail.com"
    @Published var password: String = "123456"
    @Published var state: LoginState = .idle
    private let loginUseCase: LoginRemoteUseCase
    private let retryController: any RetryControllerProtocol
    
    init(loginRemoteUseCase: LoginRemoteUseCase, retryController: any RetryControllerProtocol) {
        self.loginUseCase = loginRemoteUseCase
        self.retryController = retryController
    }
        
    func login() async {
        updateState(.loading)
        
        do {
            let data: LoginEntity = try await loginUseCase.login(email: email, password: password)
            print(data)
            updateState(.success(data: data))
        } catch {
            updateState(.error(LoginError(message: error.localizedDescription, retryAction: {
                Task { await self.login() }
            })))
        }
    }
    
    func handleAction(_ action: LoginAction) {
        switch action {
        case .refresh:
            Task { await login() }
        case .logout:
            // Implementar lógica de logout
            break
        case .goToSettings:
            // Navegação para settings
            break
        }
    }
    
    private func updateState(_ newState: LoginState) {
        DispatchQueue.main.async {
            self.state = newState
        }
    }
}
