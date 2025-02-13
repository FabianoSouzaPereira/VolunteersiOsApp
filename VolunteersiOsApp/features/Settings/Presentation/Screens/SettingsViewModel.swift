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
    private var useCase: SettingsRemoteUseCase
    
    init(useCase: SettingsRemoteUseCase) {
        self.useCase = useCase
    }
    
    func getSettings() async {
        do {
            
            let data: [SettingsEntity] = try await useCase.getSettings()
            state = .success(data: data)
            
        } catch {
            state = .error(SettingsError(message: error.localizedDescription, retryAction: {
                await self.getSettings()
            }))
        }
    }
}
