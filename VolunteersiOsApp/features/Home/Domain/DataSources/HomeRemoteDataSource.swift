//
//  HomeRemoteDataSource.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 06/02/25.
//

protocol HomeRemoteDataSource {
    func fetchHomeData() async throws -> [HomeModel]
}

