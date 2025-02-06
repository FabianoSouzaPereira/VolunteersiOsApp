//
//  NetworkModule.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 04/02/25.
//

import Foundation
import Swinject

class NetworkModule {
    static func register(in container: Container) {
        container.register(NetworkService.self) { _ in NetworkServiceImpl() }
            .inObjectScope(.container)

        container.register(ApiClient.self) { _ in ApiClient(baseUrl: "https://api.example.com") }
            .inObjectScope(.container)
    }
}
