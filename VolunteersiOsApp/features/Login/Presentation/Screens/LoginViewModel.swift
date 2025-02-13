//
//  LoginViewModel.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 04/02/25.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var state: LoginState = .initial
    private let loginUseCase: LoginRemoteUseCase
    
    init(loginRemoteUseCase: LoginRemoteUseCase) {
        self.loginUseCase = loginRemoteUseCase
    }

    func login() async {
        do {
            
            let data: [LoginEntity] = try await loginUseCase.login()
            state = .success(data: data)
            
        } catch {
            state = .error(LoginError(message: error.localizedDescription, retryAction: {
                await self.login()
            }))
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
}
