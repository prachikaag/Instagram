//
//  FeedCellView.swift
//  Instagram
//
//  Created by PRACHIKA AGARWAL on 10/04/24.
//

import SwiftUI

struct FeedCellView: View {
    let post: Post
    var body: some View {
        VStack{
            //image + username
            HStack{
                if let user = post.user{
                    CircularProfileImageView(user: user, size: .xsmall)
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Spacer()
                }
            }
            .padding(.leading,10)
            //post image
            Image(post.imageurl)
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            // action buttons
            HStack(spacing:16){
                Button{
                    print("Like Post")
                } label:{
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                Button{
                    print("Comment on Post")
                } label:{
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                Button{
                    print("Share Post")
                } label:{
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                Spacer()
            }
            .padding(.leading,8)
            .padding(.top,4)
            .foregroundColor(.black)
                
            //likes label
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading,10)
                .padding(.top,3)
            
            //caption label
            HStack{
                Text("\(post.user?.username ?? "")  ").fontWeight(.semibold) +
                Text("\(post.capion)")
                Spacer()
            }
            .font(.footnote)
            .padding(.leading,10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top,1)
                
            Text("6 hrs ago")
                .font(.footnote)
                .padding(.leading,10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top,1)
        }
    }
}

struct FeedCellView_Preview: PreviewProvider {
    static var previews: some View{
        FeedCellView(post: Post.MOCK_POSTS[2])
    }
}
