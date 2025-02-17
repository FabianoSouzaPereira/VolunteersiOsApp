//
//  LoginErrorScreen.swift
//  VolunteersiOsApp
//
//  Created by Fabiano Pereira on 15/02/25.
//

import Foundation
import SwiftUI

struct LoginErrorView: View {
    let error: LoginError
    @StateObject private var retryController = DefaultRetryController()
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.red)
            
            Text("Ocorreu um erro")
                .font(.headline)
                .foregroundColor(.red)
            
            Text(error.message)
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Button("Tentar novamente") {
                guard retryController.isRetryEnabled else { return }
                retryController.incrementRetryCount()
                Task {
                    await error.retryAction!()
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
            .disabled(!retryController.isRetryEnabled)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
