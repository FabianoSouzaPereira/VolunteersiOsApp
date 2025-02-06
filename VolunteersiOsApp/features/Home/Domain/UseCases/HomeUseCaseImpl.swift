//
//  HomeUseCaseImpl.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 06/02/25.
//

final class HomeUseCaseImpl: HomeUseCase {
    private let repository: HomeRemoteRepository

    init(repository: HomeRemoteRepository) {
        self.repository = repository
    }

    func fetchHomeData() async throws -> [HomeEntity] {
        return try await repository.getHomeData()
    }
}
