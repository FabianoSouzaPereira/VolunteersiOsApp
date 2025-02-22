//
//  StateExtension.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 24/02/25.
//

import Foundation
import SwiftUI

enum ViewState<T: Equatable, E: Equatable>: Equatable {
    case idle
    case loading
    case success(T)
    case error(E)
    
    static func == (lhs: ViewState<T, E>, rhs: ViewState<T, E>) -> Bool {
        switch (lhs, rhs) {
            case (.idle, .idle), (.loading, .loading):
                return true
            case (.success(_), .success(_)):
                return true
            case (.error(let lhsErr), .error(let rhsErr)):
                return lhsErr == rhsErr
            default:
                return false
        }
    }
}

