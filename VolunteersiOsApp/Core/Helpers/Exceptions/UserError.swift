//
//  UserError.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 21/02/25.
//

import SwiftUI

/// User-related errors
enum UserError: RequestError {
    case userNotFound
    case emailAlreadyInUse
    case passwordTooWeak
    case invalidToken
    case accountLocked
    case sessionExpired
    
    var message: String {
        switch self {
            case .userNotFound: return "User not found"
            case .emailAlreadyInUse: return "Email already in use"
            case .passwordTooWeak: return "Password is too weak"
            case .invalidToken: return "Invalid authentication token"
            case .accountLocked: return "Account locked"
            case .sessionExpired: return "Session expired"
        }
    }
}
