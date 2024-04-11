//
//  UploadPostsViewModel.swift
//  Instagram
//
//  Created by PRACHIKA AGARWAL on 10/04/24.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase

@MainActor
class UploadPostsViewModel: ObservableObject{
    @Published var selectedImage: PhotosPickerItem?{
        didSet { Task {await loadimage(fromItem: selectedImage)} }
    }
    
    @Published var postimage:Image?
    private var uiImage: UIImage?
    
    func loadimage(fromItem item: PhotosPickerItem?) async{
        guard let item = item else {return}
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data:data) else { return }
        self.uiImage = uiImage
        self.postimage = Image(uiImage: uiImage)
    }
    
    func uploadPosts(caption: String) async throws{
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let uiImage = uiImage else { return }
        
        let postRef = Firestore.firestore().collection("posts").document()
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage) else { return }
        let post = Post(id: postRef.documentID, owneruid: uid, capion: caption, likes: 0, imageurl: imageUrl, timestamp: Timestamp())
        guard let encodedPost = try? Firestore.Encoder().encode(post) else {return}
        
        try await postRef.setData(encodedPost)
    }
}
