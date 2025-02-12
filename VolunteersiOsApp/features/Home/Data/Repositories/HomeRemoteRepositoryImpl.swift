//
//  HomeRepositoryImpl.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 06/02/25.
//

final class HomeRemoteRepositoryImpl: HomeRemoteRepository {
    private let remoteDataSource: HomeRemoteDataSource

    init(remoteDataSource: HomeRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func getHomeData() async throws -> [HomeEntity] {
        let models = try await remoteDataSource.fetchHomeData()
        return models.map {
            HomeEntity(
                id: $0.id,
                username: $0.username,
                lastLogin: $0.lastLogin,
                notifications: $0.notifications
            )
        }
    }
}

