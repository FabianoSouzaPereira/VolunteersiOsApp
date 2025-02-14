//
//   HomeRemoteDataSourceImpl.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 06/02/25.
//

import Foundation

final class  HomeRemoteDataSourceImpl: HomeRemoteDataSource {
    
    func fetchHomeData() async throws -> [HomeModel] {
        return [HomeModel(id: "100",username: "Fabiano", lastLogin: Date(), notifications: 0)]
    }
    
}
