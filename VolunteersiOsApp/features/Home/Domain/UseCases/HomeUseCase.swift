//
//  HomeUseCase.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 06/02/25.
//

protocol HomeUseCase {
    func fetchHomeData() async throws -> [HomeEntity]
}

