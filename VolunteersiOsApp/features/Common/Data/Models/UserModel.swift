//
//  UserModel.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 16/02/25.
//

import Foundation

/**
 Using an extension in the UserModel implements UserEntity in a safer way:
 This way, Swift knows exactly which types will be used and can generate the Codable methods correctly.
 - Functions:
   - func fromJson(_ jsonData: Data)
   - func toJson()
 - Returns: model
 - Throws: DecodingError.dataCorrupted → The JSON is malformed or the data is not compliant as expected.
 DecodingError.keyNotFound → A required key is missing from the JSON.
 DecodingError.typeMismatch → The data type in the JSON does not match the type expected in the Model.
 DecodingError.valueNotFound → An expected value is null or missing in JSON.
 
 */
struct UserModel: UserEntity, Codable {
    var id: String
    var profilePicture: URL?
    var email: String
    var username: String
    var address: UserAddressModel
    var phones: UserPhonesModel
    var socialmedia: UserSocialMediaModel
    var notificationSettings: UserNotificationSettingsModel
    var lastLogin: Date
    var isActive: Bool
    var createdAt: Date
}

extension UserModel {
    static func fromJson(_ jsonData: Data) -> Result<UserModel, Error> {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        do {
            let decodedUser = try decoder.decode(UserModel.self, from: jsonData)
            return .success(decodedUser)
        } catch let decodingError as DecodingError {
            print("Decode error: \(decodingError.localizedDescription)")
            return .failure(decodingError)
        } catch {
            print("Unspected error: \(error.localizedDescription)")
            return .failure(error)
        }
    }

    func toJson() throws -> Data {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        return try encoder.encode(self)
    }
}
