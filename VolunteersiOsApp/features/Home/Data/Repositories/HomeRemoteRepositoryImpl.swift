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
        let entity: [HomeEntity] = try await remoteDataSource.fetchHomeData() as [HomeEntity]
        
       // let entity = [models as! HomeEntity]
        return entity
    }
}

