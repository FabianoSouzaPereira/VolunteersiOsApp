//
//  DataModule.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 06/02/25.
//

import Swinject

class DataModule {
    static func register(in container: Container) {
        container.register(UserRepository.self) { resolver in
            UserRepositoryImpl(apiClient: resolver.resolve(ApiClient.self)!)
        }.inObjectScope(.container)
    }
}
