//
//  PostService.swift
//  Instagram
//
//  Created by PRACHIKA AGARWAL on 11/04/24.
//

import Firebase

struct PostService {
    private static let postCollection = Firestore.firestore().collection("posts")
    
    static func fetchFeedPosts() async throws -> [Post] {
        let snapshot = try await postCollection.getDocuments()
        var posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
        
        for i in 0 ..< posts.count{
            let post = posts[i]
            let ownerUid = post.owneruid
            let postUser = try await UserService.fetchUserWithUid(withUid: ownerUid)
            posts[i].user = postUser
        }
        print(posts)
        return posts
    }
    
    static func fetchUserPosts(uid: String) async throws -> [Post] {
        let snapshot = try await postCollection.whereField("owneruid", isEqualTo: uid).getDocuments()
        return try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
    }
}
