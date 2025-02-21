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
    
    func goToHome() {
        DispatchQueue.main.async {
            self.path.removeLast(self.path.count)
            self.path.append(Screen.home)
        }
    }
    
    func goToLogin() {
        DispatchQueue.main.async {
            self.path.removeLast(self.path.count)
            self.path.append(Screen.login)
        }
    }
    
    func goToSettings() {
        DispatchQueue.main.async {
            self.path.removeLast(self.path.count)
            self.path.append(Screen.settings)
        }
    }
    
    func goBack() {
        DispatchQueue.main.async {
            self.path.removeLast()
        }
    }
}
