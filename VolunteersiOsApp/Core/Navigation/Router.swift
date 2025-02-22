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
        DispatchQueue.main.async {
            self.path.removeLast(self.path.count)
            self.path.append(Screen.splash)
       }
    }
    
    func goToLogin() {
        DispatchQueue.main.async {
            self.path.append(Screen.login)
        }
    }
    
    /* Regardless of where you call goToHome(), the navigation will always lead to HomeView correctly.
     If already in HomeView, the screen will not be recreated, so the state will not be reset. */
    func goToHome() {
        DispatchQueue.main.async {
            self.path = NavigationPath([Screen.home])
        }
    }
    
    func goToSettings() {
        DispatchQueue.main.async {
            self.path.append(Screen.settings)
        }
    }
    
    func goBack() {
        DispatchQueue.main.async {
            self.path.removeLast()
            self.path.append(Screen.home)
        }
    }
    
//    func goToUserProfile() {
//        DispatchQueue.main.async {
//            self.path.append(Screen.profile)
//        }
//    }
//
//    func goToAbout() {
//        DispatchQueue.main.async {
//            self.path.append(Screen.about)
//        }
//    }
}
