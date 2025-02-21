//
//  FirestoreUserAddressEntity.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 19/02/25.
//

import Foundation

protocol FirestoreUserAddressEntity {
    var street: String { get }
    var number: String { get }
    var city: String { get }
    var state: String { get }
    var country: String { get }
    var zipCode: String { get }    
}
