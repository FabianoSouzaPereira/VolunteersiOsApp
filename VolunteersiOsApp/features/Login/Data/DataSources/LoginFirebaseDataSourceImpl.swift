//
//  LofinFirebaseDataSourceImpl.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 16/02/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class LoginFirebaseDataSourceImpl: LoginRemoteDataSource {
    
    private let auth: Auth
    private let firestore: Firestore
    
    
    init(auth: Auth, firestore: Firestore) {
        self.auth = auth
        self.firestore = firestore
    }
    
    func login(email: String, password: String) async throws -> LoginModel {
        do {
            let result = try await auth.signIn(withEmail: email, password: password)
            let user = result.user
            
            // Obtendo o ID Token do usuário
            let idTokenResult = try await user.getIDTokenResult(forcingRefresh: true)
            
            let isAdminClaim = (idTokenResult.claims["admin"] as? Bool) ?? false
            
            
            AppConfig(initialState: true).saveAdminClaim(adminClaim: isAdminClaim)
            
            return LoginModel(
                id: user.uid,
                username: user.displayName ?? "",
                lastLogin: Date(),
                notifications: 0,
                token: idTokenResult.token
            )
        } catch {
            throw NSError(domain: "AuthError", code: 400, userInfo: [NSLocalizedDescriptionKey: "Erro de autenticação: \(error.localizedDescription)"])
        }
    }
    
    func fetchUserData(uid: String) async throws -> FirestoreUserModel {
        let document = try await firestore.collection("users").document(uid).getDocument()
        
        guard let data = document.data() else {
            throw NSError(domain: "FirestoreError", code: 404, userInfo: [NSLocalizedDescriptionKey: "Usuário não encontrado"])
        }
        
        return FirestoreUserModel(
            document: [ "User": (id: data["uid"] as? String ?? "",
                                 name: data["name"] as? String ?? "",
                                 email: data["email"] as? String ?? "",
                                 address: data["address"] as? String ?? "")
            ]
        )!
    }
}



