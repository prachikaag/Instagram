//
//  UserStatView.swift
//  Instagram
//
//  Created by PRACHIKA AGARWAL on 10/04/24.
//

import SwiftUI

struct UserStatView: View {
    let value: Int
    let title: String
    var body: some View {
        VStack{
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text("\(title)")
                .font(.footnote)
        }
        .frame(width: 72)
    }
}

struct UserStatView_Preview: PreviewProvider {
    static var previews: some View{
        UserStatView(value: 12, title: "Posts")
    }
}
