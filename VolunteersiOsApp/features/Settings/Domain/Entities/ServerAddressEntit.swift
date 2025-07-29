//
//  ServerAddressEntit.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 26/02/25.
//

import Foundation

protocol ServerAddressEntity {
    var host: String { get }
    var port: Int { get }
}
