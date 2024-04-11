//
//  SearchViewModel.swift
//  Instagram
//
//  Created by PRACHIKA AGARWAL on 10/04/24.
//

import Foundation

class SearchViewModel: ObservableObject{
    @Published var users = [User]()
    
    init(){
        Task {try await fetchAllUsers()}
    }
    @MainActor
    func fetchAllUsers() async throws{
        self.users = try await UserService.fetchAllUsers()
    }
}
