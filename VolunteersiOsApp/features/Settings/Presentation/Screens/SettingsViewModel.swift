//
//  SettingsViewModel.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 04/02/25.
//

import Foundation
import Combine

class SettingsViewModel: ObservableObject {
    @Published var state: SettingsState = .initial
    private var router: Router
    private var useCase: SettingsRemoteUseCase
    private let retryController: any RetryControllerProtocol
    
    init(useCase: SettingsRemoteUseCase, router: Router, retryController: any RetryControllerProtocol) {
        self.useCase = useCase
        self.router = router
        self.retryController = retryController
    }
    
    func getSettings() async {
        
        if(!retryController.isRetryEnabled){
            return
        }
        
        do {
            let data: [SettingsEntity] = try await useCase.getSettings()
            updateState(.success(data: data))
            retryController.resetRetryCount()
            
        } catch {
            retryController.incrementRetryCount()
            updateState(.error(SettingsError(message: error.localizedDescription) { [weak self] in
                await self?.getSettings()
            }))
        }
    }

    
    func handleAction(_ action: SettingsAction) {
        switch action {
            case .refresh:
                Task { await getSettings() }
            case .logout:
                Task {
                    TokenManager.shared.removeToken()
                    router.goToLogin()
                }
                break
            case .goToSettings:
                    // Navegação para settings
                break
            case .goToHome:
                Task {
                    router.goToHome()
                }
        }
    }
    
    private func updateState(_ newState: SettingsState) {
        DispatchQueue.main.async {
            self.state = newState
        }
    }
    
    func resetState() {
        DispatchQueue.main.async {
            self.state = .idle
            self.clearInputFields()
        }
    }
    
    func clearInputFields() {}
}
