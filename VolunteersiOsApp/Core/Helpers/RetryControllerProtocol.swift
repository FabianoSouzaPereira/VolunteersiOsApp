//
//  RetryControllerProtocol.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 15/02/25.
//

import SwiftUI

protocol RetryControllerProtocol: ObservableObject {
    var isRetryEnabled: Bool { get }
    func incrementRetryCount()
    func resetRetryCount()
}
