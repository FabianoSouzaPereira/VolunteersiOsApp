//
//  RetryController.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 15/02/25.
//

import SwiftUI

class DefaultRetryController: RetryControllerProtocol {
    @Published private(set) var retryCount: Int = 0
    private let maxRetries = 3
    
    var isRetryEnabled: Bool {
        return retryCount < maxRetries
    }
    
    func incrementRetryCount() {
        retryCount += 1
    }
    
    func resetRetryCount() {
        retryCount = 0
    }
}
