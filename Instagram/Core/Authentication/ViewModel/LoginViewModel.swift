//
//  LoginViewModel.swift
//  Instagram
//
//  Created by PRACHIKA AGARWAL on 10/04/24.
//

import Foundation

class LoginViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    
    func signin() async throws{
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
