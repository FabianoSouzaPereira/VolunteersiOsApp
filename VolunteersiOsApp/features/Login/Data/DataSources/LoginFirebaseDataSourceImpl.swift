//
//  LofinFirebaseDataSourceImpl.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 16/02/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class LoginFirebaseDataSourceImpl: LoginFirebaseDataSource {
    private let auth: Auth
    private let firestore: Firestore
    
    
    init(auth: Auth, firestore: Firestore) {
        self.auth = auth
        self.firestore = firestore
    }
    
    func login(email: String, password: String) async throws -> LoginFirebaseModel {
        do {

            let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
            
            let user = authResult.user
            
            let loginModel = LoginFirebaseModel(
                id: user.uid,
                username: user.displayName ?? user.email ?? "",
                lastLogin: Date(),
                notifications: 0,
                token: user.refreshToken ?? ""
            )
            
            return loginModel
            
        } catch let error as NSError {
            let requestError: RequestError
            
            switch error.code {
                case AuthErrorCode.userNotFound.rawValue:
                    requestError = UserError.userNotFound
                case AuthErrorCode.wrongPassword.rawValue:
                    requestError = UserError.passwordTooWeak
                case AuthErrorCode.emailAlreadyInUse.rawValue:
                    requestError = UserError.emailAlreadyInUse
                case AuthErrorCode.invalidCredential.rawValue:
                    requestError = UserError.invalidToken
                default:
                    requestError = GeneralRequestError.serverError
            }
            
            throw requestError
        } catch {
            
            throw GeneralRequestError.serverError
        }
    }
    
    func fetchUserData(uid: String) async throws -> FirestoreUserModel {
        let document = try await firestore.collection("users").document(uid).getDocument()
        
        guard let data = document.data() else {
            throw NSError(domain: "FirestoreError", code: 404, userInfo: [NSLocalizedDescriptionKey: "Usuário não encontrado"])
        }
        
        return try FirestoreUserModel(
            from: [ "User": (id: data["uid"] as? String ?? "",
                                 name: data["name"] as? String ?? "",
                                 email: data["email"] as? String ?? "",
                                 address: data["address"] as? String ?? "")
            ] as! Decoder
        )
    }
}



