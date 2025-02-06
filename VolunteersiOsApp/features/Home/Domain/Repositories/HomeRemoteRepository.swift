//
//  HomeRepository.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 06/02/25.
//

protocol HomeRemoteRepository {
    func getHomeData() async throws -> [HomeEntity]
}
