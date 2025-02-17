//
//  FirebaseModule.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 13/02/25.
//

import Swinject
import Firebase
import FirebaseAuth
import FirebaseFirestore

class FirebaseModule {
    static func register(in container: Container) {
        container.register(FirebaseApp.self) { _ in
            FirebaseApp.configure()
            return FirebaseApp.app()!
        }.inObjectScope(.container)
        
        container.register(Auth.self) { _ in
            Auth.auth()
        }.inObjectScope(.container)

        container.register(Firestore.self) { _ in
            Firestore.firestore()
        }.inObjectScope(.container)
        
        container.register(AuthManager.self) { _ in AuthManager() }
            .inObjectScope(.container)
    }
}
