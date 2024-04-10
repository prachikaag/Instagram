//
//  ProfileHeaderView.swift
//  Instagram
//
//  Created by PRACHIKA AGARWAL on 10/04/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user:User
    var body: some View {
            VStack{
                //Header View
                HStack{
                    // pic and stats
                    Image(user.profileImageUrl ?? "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100,height: 100)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
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
                    
                } label: {
                    Text("Edit Profie")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width:360,height:32)
                        .foregroundColor(Color.black)
                        .overlay{
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.gray, lineWidth: 1)
                        }
                }
                Divider()
            }
            .padding(.leading,10)
        }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USRS[3])
}
