//
//  DataModule.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 06/02/25.
//

import Swinject

class DataModule {
    static func register(in container: Container) {
        container.register(AppConfig.self) { _ in
            AppConfig(initialState: true)
        }
        
        container.register((any RetryControllerProtocol).self) { _ in
            DefaultRetryController()
        }
        .inObjectScope(.container)
    }
}
