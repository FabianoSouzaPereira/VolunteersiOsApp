//
//  GeneralRequestError.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 21/02/25.
//

import SwiftUI

/// General request errors
enum GeneralRequestError: RequestError {
    case serverError
    case unauthorized
    case badRequest
    case forbidden
    case conflict
    case unknownError
    
    var message: String {
        switch self {
            case .serverError: return "Server error"
            case .unauthorized: return "Unauthorized"
            case .badRequest: return "Bad request"
            case .forbidden: return "Forbidden access"
            case .conflict: return "Data conflict"
            case .unknownError: return "Unknown Error"
        }
    }
}
