//
//  EditProfileViewModel.swift
//  Instagram
//
//  Created by PRACHIKA AGARWAL on 11/04/24.
//

import PhotosUI
import SwiftUI
import Firebase

@MainActor
class EditProfileViewModel:ObservableObject{
    
    @Published var user: User
    
    @Published var selectedImage: PhotosPickerItem?{
        didSet { Task {await loadimage(fromItem: selectedImage)} }
    }
    @Published var fullname = ""
    @Published var bio = ""
    
    @Published var profileImage:Image?
    
    init(user:User){
        self.user = user
    }
    
    func loadimage(fromItem item: PhotosPickerItem?) async{
        guard let item = item else {return}
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data:data) else { return }
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserData() async throws {
        // update profile pic if changed
        
        var data = [String: Any]()
        // update name if changed
        if !fullname.isEmpty && user.fullname != fullname{
            data["fullname"] = fullname
        }
        // update bio if changed
        if !bio.isEmpty && user.bio != bio{
            data["bio"] = bio
        }
        
        if !data.isEmpty{
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
}
