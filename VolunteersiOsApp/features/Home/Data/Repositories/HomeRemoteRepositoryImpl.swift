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
        return models.map { HomeEntity(id: $0.id, title: $0.title, description: $0.description) }
    }
}

