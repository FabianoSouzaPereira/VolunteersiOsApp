//
//  SettingsView.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 04/02/25.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack {
            Text("Configurações")
                .font(.largeTitle)
                .padding()
            
            Button("Voltar para Home") {
                router.goToHome()
            }
            .buttonStyle(.bordered)
        }
    }
}
