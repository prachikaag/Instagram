//
//  UploadPostsView.swift
//  Instagram
//
//  Created by PRACHIKA AGARWAL on 10/04/24.
//

import SwiftUI

struct UploadPostsView: View {
    @State private var caption = ""
    @State private var imagepickerpresented = false
    @StateObject var viewmodel = UploadPostsViewModel()
    @Binding var tabIndex: Int
    
    var body: some View {
        VStack{
            // action toolbar
            HStack{
                Button{
                    clearPostDataAndReturnToFeed()
                } label:{
                    Text("Cancel")
                }
                Spacer()
                Text("New Post")
                    .fontWeight(.semibold)
                Spacer()
                Button{
                    Task{
                        try await viewmodel.uploadPosts(caption: caption)
                        clearPostDataAndReturnToFeed()
                    }
                } label:{
                    Text("Upload")
                        .fontWeight(.semibold)
                }
            }
            .padding(.horizontal)
            // post image and caption
            HStack(spacing: 8){
                if let image = viewmodel.postimage{
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width:100,height:100)
                        .clipped()
                }
                
                TextField("Enter your caption", text: $caption, axis: .vertical)
            }
            Spacer()
        }
        .onAppear{
            imagepickerpresented.toggle()
        }
        .photosPicker(isPresented: $imagepickerpresented, selection: $viewmodel.selectedImage)
    }
    
    func clearPostDataAndReturnToFeed(){
        caption = ""
        viewmodel.selectedImage = nil
        viewmodel.postimage = nil
        tabIndex = 0
    }
}

struct UploadPostsView_Preview: PreviewProvider {
    static var previews: some View{
        UploadPostsView(tabIndex:.constant(0))
    }
}
