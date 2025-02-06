//
//  HomeState.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 04/02/25.
//
//  What does this code do?
// - Encapsulates screen data with HomeData to avoid loose variables in the ViewModel.
// - Manage screen states with HomeState, separating loading, success and error.
// - Defines structured error messages with HomeError, allowing "Try Again" with a retryAction.
// - Manages user actions with HomeAction, helping the ViewModel react to events.
// - Creates a default initial state (.initial) to facilitate ViewModel initialization.
//

import Foundation


struct HomeData {
    let username: String
    let lastLogin: Date
    let notifications: Int

    static let empty = HomeData(username: "", lastLogin: Date(), notifications: 0)
}

enum HomeState {
    case idle
    case loading
    case success(data: [HomeEntity])
    case error(HomeError)
}

struct HomeError: Identifiable {
    let id = UUID()
    let message: String
    let retryAction: (@MainActor () async -> Void)?
}


enum HomeAction {
    case refresh
    case logout
    case goToSettings
}


extension HomeState {
    static var initial: HomeState {
        return .loading
    }
}
