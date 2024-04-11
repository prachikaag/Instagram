//
//  CurrentUserProfileView.swift
//  Instagram
//
//  Created by PRACHIKA AGARWAL on 10/04/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    let user: User

    var body: some View {
        NavigationStack{
            ScrollView{
                //header
                ProfileHeaderView(user: user)
                // post grid view
                ProfileGridView(user: user)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                Button{
                    AuthService.shared.signout()
                } label :{
                    Image(systemName: "line.3.horizontal")
                        .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct CurrentUserProfileView_Preview: PreviewProvider {
    static var previews: some View{
        CurrentUserProfileView(user: User.MOCK_USRS[3])
    }
}
