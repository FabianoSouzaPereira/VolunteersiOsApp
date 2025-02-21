//
//  NetworkError.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 21/02/25.
//

import SwiftUI

/// Network-related errors
enum NetworkError: RequestError {
    case networkFailure
    case timeout
    
    var message: String {
        switch self {
            case .networkFailure: return "Network error"
            case .timeout: return "Request timed out"
        }
    }
}
