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
    private let homeUseCase: HomeUseCase

    init(homeUseCase: HomeUseCase) {
        self.homeUseCase = homeUseCase
    }

    func loadHomeData() async {
        state = .loading
        
        do {
            let data: [HomeEntity] = try await homeUseCase.fetchHomeData()
            state = .success(data: data)
        } catch {
            state = .error(HomeError(message: error.localizedDescription) { [weak self] in
                await self?.loadHomeData()
            })
        }
    }


    func handleAction(_ action: HomeAction) {
        switch action {
        case .refresh:
            Task { await loadHomeData() }
        case .logout:
            // Implementar lógica de logout
            break
        case .goToSettings:
            // Navegação para settings
            break
        }
    }
}
