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

enum LoginState: Equatable {
    case idle
    case loading
    case success(data: LoginEntity)
    case error(LoginError)
    
    static func == (lhs: LoginState, rhs: LoginState) -> Bool {
        switch (lhs, rhs) {
            case (.idle, .idle), (.loading, .loading):
                return true
            case (.success(let lhsUser), .success(let rhsUser)):
                return lhsUser.id == rhsUser.id // Comparação baseada em ID do usuário
            case (.error(let lhsError), .error(let rhsError)):
                return lhsError.message == rhsError.message // Comparação baseada na mensagem de erro
            default:
                return false
        }
    }
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

