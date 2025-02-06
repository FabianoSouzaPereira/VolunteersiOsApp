//
//  CoreModule.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 06/02/25.
//

import Swinject

class CoreModule {
    static func register(in container: Container) {
        container.register(Logger.self) { _ in Logger() }
            .inObjectScope(.container)
    }
}
