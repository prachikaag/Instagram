//
//  ProfileHeaderView.swift
//  Instagram
//
//  Created by PRACHIKA AGARWAL on 10/04/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    @State private var showEditProfile = false
    
    var body: some View {
            VStack{
                //Header View
                HStack{
                    // pic and stats
                    CircularProfileImageView(user: user, size: .large)
                    
                    Spacer()
                    
                    HStack{
                        UserStatView(value: 12, title: "Posts")
                        UserStatView(value: 105, title: "Following")
                        UserStatView(value: 312, title: "Followers")
                    }
                    
                }
                .padding(.horizontal)
                // name and bio
                VStack(alignment: .leading){
                    if let fullname = user.fullname{
                        Text(fullname)
                            .font(.footnote)
                            .fontWeight(.bold)
                    }
                    if let bio = user.bio{
                        Text(bio)
                            .font(.footnote)
                    }
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding(.horizontal)
                
                // action button
                Button{
                    if user.isCurrentUser {
                        print("Show user profile")
                        showEditProfile.toggle()
                    } else {
                        print("Follow user")
                    }
                    
                } label: {
                    Text(user.isCurrentUser ? "Edit Profie": "Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width:360,height:32)
                        .background(user.isCurrentUser ? .white : Color(.systemBlue))
                        .foregroundColor(user.isCurrentUser ? Color(.systemBlue) : .white)
                        .cornerRadius(6)
                        .overlay{
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(user.isCurrentUser ? .gray: .clear, lineWidth: 1)
                        }
                }
                
                Divider()
            }
            .padding(.leading,10)
            .fullScreenCover(isPresented: $showEditProfile){
                EditProfileView(user: user)
        }
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USRS[3])
}
