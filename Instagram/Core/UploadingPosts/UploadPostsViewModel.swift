//
//  UploadPostsViewModel.swift
//  Instagram
//
//  Created by PRACHIKA AGARWAL on 10/04/24.
//

import Foundation
import PhotosUI
import SwiftUI

@MainActor
class UploadPostsViewModel: ObservableObject{
    @Published var selectedImage: PhotosPickerItem?{
        didSet { Task {await loadimage(fromItem: selectedImage)} }
    }
    
    @Published var postimage:Image?
    
    func loadimage(fromItem item: PhotosPickerItem?) async{
        guard let item = item else {return}
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data:data) else { return }
        self.postimage = Image(uiImage: uiImage)
    }
}
