//
//  ServerAddressModel.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 26/02/25.
//

import Foundation

struct ServerAddressModel : ServerAddressEntity,Codable {
    let host: String
    let port: Int
}
