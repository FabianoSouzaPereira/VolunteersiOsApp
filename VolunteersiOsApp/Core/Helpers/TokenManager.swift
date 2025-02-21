//
//  TokenManager.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 21/02/25.
//

import Security
import SwiftUI

class TokenManager {
    static let shared = TokenManager()
    
    private let service = "com.seuapp.token"
    private let account = "authToken"
    
    func saveToken(_ token: String) {
        let data = Data(token.utf8)
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecValueData: data
        ] as CFDictionary
        
            // Apaga qualquer token anterior antes de salvar um novo
        SecItemDelete(query)
        SecItemAdd(query, nil)
    }
    
    func getToken() -> String? {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecReturnData: true,
            kSecMatchLimit: kSecMatchLimitOne
        ] as CFDictionary
        
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query, &dataTypeRef)
        
        if status == errSecSuccess, let data = dataTypeRef as? Data {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
    
    func removeToken() {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account
        ] as CFDictionary
        
        SecItemDelete(query)
    }
}

