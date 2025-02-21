//
//  RequestError.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 21/02/25.
//

import SwiftUI

/// Base protocol for request-related approaches
protocol RequestError: LocalizedError {
    var message: String { get }
}

