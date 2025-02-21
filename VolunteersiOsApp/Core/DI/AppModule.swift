//
//  AppModule.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 04/02/25.
//

import Swinject

class AppModule {
    static let shared = AppModule()
    let container: Container

    private init() {
        container = Container()
        
        // Registra módulos core
        CoreModule.register(in: container)
        NetworkModule.register(in: container)
        DataModule.register(in: container)
        FirebaseModule.register(in: container)
        
        // Registra módulos por feature
        HomeModule.register(in: container)
        LoginModule.register(in: container)
        SettingsModule.register(in: container)
        UserModule.register(in: container)
    }

    func resolve<T>(_ type: T.Type) -> T {
        guard let dependency = container.resolve(type) else {
            fatalError("⚠️ Dependência \(type) não registrada no AppModule!")
        }
        return dependency
    }
}
