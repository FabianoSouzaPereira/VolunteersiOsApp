//
//  LoginViewModel.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 04/02/25.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var state: LoginState = .idle
    private let loginUseCase: LoginRemoteUseCase
    private let retryController: any RetryControllerProtocol
    
    init(loginRemoteUseCase: LoginRemoteUseCase, retryController: any RetryControllerProtocol) {
        self.loginUseCase = loginRemoteUseCase
        self.retryController = retryController
    }
        
    func login() async {
        state = .loading
        do {
            let data: LoginEntity = try await loginUseCase.login(email: email, password: password)
            state = .success(data: data)
        } catch {
            state = .error(LoginError(message: error.localizedDescription, retryAction: {
                await self.login()
            }))
        }
    }
    
>>>>>>> 39347e4 (rebased)
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
