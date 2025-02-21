//
//  FirestoreUserPhonesModel.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 19/02/25.
//

import Foundation

struct FirestoreUserPhonesModel: FirestoreUserPhonesEntity {
    var mobile: String
    var home: String?
    var work: String?
    
    init(document: [String: Any]) {
        self.mobile = document["mobile"] as? String ?? ""
        self.home = document["home"] as? String ?? ""
        self.work = document["work"] as? String ?? ""
    }
    
    func toDictionary() -> [String: Any] {
        return [
            "mobile": mobile,
            "home": home!,
            "work": work!,
        ]
    }
}

