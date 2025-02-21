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
    @Published var isLoading = false
    
    private let loginUseCase: LoginRemoteUseCase
    private let errorHandler: ErrorHandler
    private let retryController: any RetryControllerProtocol
    
    
    init(loginRemoteUseCase: LoginRemoteUseCase, errorHandler: ErrorHandler, retryController: any RetryControllerProtocol) {
        self.loginUseCase = loginRemoteUseCase
        self.errorHandler = errorHandler
        self.retryController = retryController
    }
        
    func login() async {
        updateState(.loading)
        
        do {
            let user = try await loginUseCase.login(email: email, password: password)
            updateState(.success(data: user))
        } catch let error as RequestError {
            errorHandler.handleError(error)
            updateState(.error(LoginError(message: error.localizedDescription, retryAction: {
                Task { await self.login() }
            })))
        } catch {
            let unknownError = GeneralRequestError.serverError
            errorHandler.handleError(unknownError)
            updateState(.error(LoginError(message: GeneralRequestError.unauthorized.message, retryAction: {
                Task { await self.login() }
            })))
        }
    }
    
    
    func handleAction(_ action: LoginAction) {
        switch action {
        case .refresh:
            Task { await login() }
        case .logout:
            Task {
                TokenManager.shared.removeToken()
                updateState(.idle)
            }
            break
        case .goToSettings:
            // Navegação para settings
            break
        }
    }
    
    private func updateState(_ newState: LoginState) {
        DispatchQueue.main.async {
            self.state = newState
            self.isLoading = self.state == .loading
        }
    }
}
