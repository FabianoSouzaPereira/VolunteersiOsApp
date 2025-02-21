//
//  FirestoreUserSocialMediaModel.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 19/02/25.
//

import Foundation

struct FirestoreUserSocialMediaModel : FirestoreUserSocialMediaEntity {
    var twitter: String?
    var facebook: String?
    var instagram: String?
    var linkedin: String?
    
    init?(document: [String: Any]) {
        self.twitter = document["twitter"] as? String
        self.facebook = document["facebook"] as? String
        self.instagram = document["instagram"] as? String
        self.linkedin = document["linkedin"] as? String
    }
    
    func toDictionary() -> [String: Any] {
        return [
            "twitter": twitter as Any,
            "facebook": facebook as Any,
            "instagram": instagram as Any,
            "linkedin": linkedin as Any
        ]
    }
}
