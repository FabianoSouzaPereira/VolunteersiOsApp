//
//  HomeViewModel.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 04/02/25.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    @Published var state: HomeState = .initial
    @Published var isLoading = false
    private var router: Router
    private let homeUseCase: HomeUseCase
    private let retryController: any RetryControllerProtocol

    init(homeUseCase: HomeUseCase, router: Router, retryController: any RetryControllerProtocol) {
        self.homeUseCase = homeUseCase
        self.router = router
        self.retryController = retryController
    }

    func loadHomeData() async {
        if(!retryController.isRetryEnabled){
            return
        }
        updateState(.loading)
        
        do {
            let data: [HomeEntity] = try await homeUseCase.fetchHomeData()
            updateState(.success(data: data))
        } catch {
            updateState(.error(HomeError(message: error.localizedDescription) { [weak self] in
                await self?.loadHomeData()
            }))
        }
    }


    func handleAction(_ action: HomeAction) {
        switch action {
        case .refresh:
            Task { await loadHomeData() }
        case .logout:
                Task {
                    TokenManager.shared.removeToken()
                    router.goToLogin()
                }
            break
        case .goToSettings:
            // Navegação para settings
            break
        }
    }
    
    private func updateState(_ newState: HomeState) {
        DispatchQueue.main.async {
            self.state = newState
            print("\(self.state)")
        }
    }
    
    func isStateLoading() {
        DispatchQueue.main.async {
            self.isLoading = self.state == .loading
            print("Loading... \(self.state == .loading)")
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
