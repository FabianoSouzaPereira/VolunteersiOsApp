//
//  FirestoreUserModel.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 17/02/25.
//

import Foundation
import FirebaseCore
import FirebaseAuth

struct FirestoreUserModel: UserEntity, Decodable, Encodable {
    var id: String
    var email: String
    var username: String
    var address: [String: Any] // Usando dicionário, por exemplo
    var phones: [String: Any]
    var socialMedia: [String: Any]
    var lastLogin: Timestamp
    var notifications: Int
    
    // Mapeamento da Entidade para o Modelo
    func toEntity() -> UserEntity {
        return User(id: id, email: email, username: username, address: address, phones: phones, socialMedia: socialMedia, lastLogin: lastLogin.dateValue(), notifications: notifications)
    }
    
    // Mapeamento do Modelo para a Entidade
    static func fromEntity(_ entity: UserEntity) -> FirestoreUserModel {
        return FirestoreUserModel(id: entity.id, email: entity.email, username: entity.username, address: ["street": entity.address.street, "city": entity.address.city], phones: ["mobile": entity.phones.mobile], socialMedia: ["twitter": entity.socialMedia.twitter], lastLogin: Timestamp(date: entity.lastLogin), notifications: entity.notifications)
    }
}
