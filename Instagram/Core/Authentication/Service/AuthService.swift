//
//  AuthService.swift
//  Instagram
//
//  Created by PRACHIKA AGARWAL on 10/04/24.
//

import Foundation
import FirebaseAuth
//contains functions authenticating user

class AuthService {

    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init(){
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) async throws{
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: LOGIN FAILED \(error.localizedDescription)")
        }
    }
    
    func createUser(email: String, password: String, username: String) async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: SIGNUP FAILED \(error.localizedDescription)")
        }
//        print("email is \(email)")
    }
    
    func loadUserData() async throws{
        
    }
    
    func signout(){
        try? Auth.auth().signOut()
        self.userSession = nil
    }
}
