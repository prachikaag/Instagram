//
//  ProfileGridView.swift
//  Instagram
//
//  Created by PRACHIKA AGARWAL on 10/04/24.
//

import SwiftUI
import Kingfisher

struct ProfileGridView: View {
    @StateObject var viewmodel: ProfileGridViewModel
    
    init(user: User){
        self._viewmodel = StateObject(wrappedValue: ProfileGridViewModel(user: user))
    }
    
    private let gridItems: [GridItem] = [
            .init(.flexible(), spacing: 1),
            .init(.flexible(), spacing: 1),
            .init(.flexible(), spacing: 1)
        ]
    
    private let imagedimension: CGFloat = (UIScreen.main.bounds.width/3) - 1
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1){
            ForEach(viewmodel.posts){ post in
                KFImage(URL(string: post.imageurl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: imagedimension, height: imagedimension)
                    .clipped()
            }
            
        }
    }
}

struct PostGridView_Preview: PreviewProvider {
    static var previews: some View{
        ProfileGridView(user: User.MOCK_USRS[2])
    }
}
