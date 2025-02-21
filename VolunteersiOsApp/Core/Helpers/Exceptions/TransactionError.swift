//
//  TransactionError.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 21/02/25.
//

import SwiftUI

/// Transaction-related errors
enum TransactionError: RequestError {
    case insufficientFunds
    case itemNotFound
    case permissionDenied
    case maxAttemptsExceeded
    
    var message: String {
        switch self {
            case .insufficientFunds: return "Insufficient funds"
            case .itemNotFound: return "Item not found"
            case .permissionDenied: return "Permission denied"
            case .maxAttemptsExceeded: return "Maximum number of attempts exceeded"
        }
    }
}
