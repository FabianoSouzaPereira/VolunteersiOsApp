//
//  FirestoreUserAddressModel.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 19/02/25.
//

import Foundation

struct FirestoreUserAddressModel : FirestoreUserAddressEntity {
    var street: String
    var number: String
    var city: String
    var state: String
    var country: String
    var zipCode: String
    
    init(document: [String: Any]) {
        self.street = document["street"] as? String ?? ""
        self.number = document["number"] as? String ?? ""
        self.city = document["city"] as? String ?? ""
        self.state = document["state"] as? String ?? ""
        self.country = document["country"] as? String ?? ""
        self.zipCode = document["zipCode"] as? String ?? ""
    }
    
    func toDictionary() -> [String: Any] {
        return [
            "street": street,
            "number": number,
            "city": city,
            "state": state,
            "country": country,
            "zipCode": zipCode
        ]
    }
}
