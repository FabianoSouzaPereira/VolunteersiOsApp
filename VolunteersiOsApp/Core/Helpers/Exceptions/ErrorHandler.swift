//
//  ErrorHandler.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 21/02/25.
//

import SwiftUI

/// Error Handler to capture and display errors
class ErrorHandler: ObservableObject {
    @Published var error: RequestError?
    
    func handleError(_ error: RequestError) {
        DispatchQueue.main.async {
            self.error = error
        }
    }
}
