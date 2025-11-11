//
//  SettingsRemoteDataSource.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 06/02/25.
//

import Foundation
import FirebaseFirestore
import SwiftUI

class SettingsRemoteDataSourceImpl: SettingsRemoteDataSource {
    private let firestore: Firestore = AppModule.shared.resolve(Firestore.self)
    private let apiBaseURL = "https://api.seuservico.com/settings"
    
    @StateObject private var appConfig: AppConfig
    
    init() {
        _appConfig = StateObject(wrappedValue: AppConfig(initialState: true))
    }

    
    func getSettings() async throws -> [SettingsModel] {
            // TODO: real implamentation not created yet
        return [
            SettingsModel(
                id: 1,
                maintenanceMode: false,
                defaultLanguage: "en",
                privacyPolicyURL: "https://example.com/privacy",
                termsOfServiceURL: "https://example.com/terms",
                appVersion: "1.0.0",
                featureToggle: true,
                serverAddress: ServerAddressModel(host: "localhost", port: 8080),
                supportContactEmail: "support@example.com",
                defaultTimezone: "UTC",
                maxUploadSize: 10485760,
                analyticsEnabled: true,
                chatEnabled: true,
                darkMode: false
            )
        ]
        
        if appConfig.isUsingFirebase {
            return try await fetchSettingsFromFirestore()
        } else {
            return try await fetchSettingsFromAPI()
        }
    }
    
    private func fetchSettingsFromFirestore() async throws -> [SettingsModel] {
        let snapshot = try await firestore.collection("settings").getDocuments()
        return snapshot.documents.compactMap { doc in
            try? doc.data(as: SettingsModel.self)
        }
    }
    
    private func fetchSettingsFromAPI() async throws -> [SettingsModel] {
        guard let url = URL(string: apiBaseURL) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode([SettingsModel].self, from: data)
    }
}
