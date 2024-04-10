//
//  ProfileGridView.swift
//  Instagram
//
//  Created by PRACHIKA AGARWAL on 10/04/24.
//

import SwiftUI

struct ProfileGridView: View {
    private let gridItems: [GridItem] = [
            .init(.flexible(), spacing: 1),
            .init(.flexible(), spacing: 1),
            .init(.flexible(), spacing: 1)
        ]
    var posts: [Post]
    
    private let imagedimension: CGFloat = (UIScreen.main.bounds.width/3) - 1
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1){
            ForEach(posts){ post in
                Image(post.imageurl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: imagedimension, height: imagedimension)
            }
            
        }
    }
}

struct PostGridView_Preview: PreviewProvider {
    static var previews: some View{
        ProfileGridView(posts: Post.MOCK_POSTS)
    }
}
