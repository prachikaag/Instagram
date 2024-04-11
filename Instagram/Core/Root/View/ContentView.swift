//
//  ContentView.swift
//  Instagram
//
//  Created by PRACHIKA AGARWAL on 10/04/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var registrationViewModel = RegistrationViewModel()
    @StateObject var viewmodel = ContentViewModel()
    var body: some View {
        Group {
            if viewmodel.userSession == nil {
                LoginView()
                    .environmentObject(registrationViewModel)
            } else if let currentUser = viewmodel.currentUser {
                MainTabView(user: currentUser)
            }
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View{
        ContentView()
    }
}
