//
//  LoginState.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 04/02/25.
//
import Foundation


struct LoginData {
    let username: String
    let lastLogin: Date
    let notifications: Int

    static let empty = LoginData(username: "", lastLogin: Date(), notifications: 0)
}

enum LoginState {
    case idle
    case loading
    case success(data: [LoginEntity])
    case error(LoginError)
}

struct LoginError: Identifiable {
    let id = UUID()
    let message: String
    let retryAction: (@MainActor () async -> Void)?
}


enum LoginAction {
    case refresh
    case logout
    case goToSettings
}


extension LoginState {
    static var initial: LoginState {
        return .loading
    }
}

