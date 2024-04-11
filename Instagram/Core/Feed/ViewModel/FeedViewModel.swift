//
//  FeedViewModel.swift
//  Instagram
//
//  Created by PRACHIKA AGARWAL on 11/04/24.
//

import Foundation
import Firebase

class FeedViewModel: ObservableObject{
    
    @Published var posts = [Post]()
    
    init(){
        Task{ try await fetchPosts() }
    }
    
    @MainActor
    func fetchPosts() async throws{
        self.posts = try await PostService.fetchFeedPosts()
    }
}
