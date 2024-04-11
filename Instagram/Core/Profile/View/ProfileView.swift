//
//  ProfileView.swift
//  Instagram
//
//  Created by PRACHIKA AGARWAL on 10/04/24.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    var body: some View {
    //  NavigationStack {
        ScrollView{
            //header
            ProfileHeaderView(user: user)
            // post grid view
            ProfileGridView(user: user)
            
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView_Preview: PreviewProvider {
    static var previews: some View{
        ProfileView(user: User.MOCK_USRS[2])
    }
}
