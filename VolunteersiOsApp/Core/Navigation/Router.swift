//
//  Router.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 05/02/25.
//

import SwiftUI

class Router: ObservableObject {
    @Published var path = NavigationPath()
    
    func goToSplash() {
        path.removeLast(path.count)
        path.append(Screen.splash)
    }
    
    func goToHome() {
        path.removeLast(path.count)
        path.append(Screen.home)
    }
    
    func goToLogin() {
        path.removeLast(path.count)
        path.append(Screen.login)
    }
    
    func goToSettings() {
        path.removeLast(path.count)
        path.append(Screen.settings)
    }
    
    func goBack() {
        path.removeLast(path.count)
        path.removeLast()
    }
}
