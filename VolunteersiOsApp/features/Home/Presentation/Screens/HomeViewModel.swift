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
    private var router: Router
    private let homeUseCase: HomeUseCase

    init(homeUseCase: HomeUseCase, router: Router) {
        self.homeUseCase = homeUseCase
        self.router = router
    }

    func loadHomeData() async {
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
        }
    }
}
