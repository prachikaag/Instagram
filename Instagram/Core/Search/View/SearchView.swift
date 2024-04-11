//
//  SearchView.swift
//  Instagram
//
//  Created by PRACHIKA AGARWAL on 10/04/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchtext  = ""
    
    @StateObject var viewmodel = SearchViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack(spacing: 8){
                    ForEach(viewmodel.users) { user in
                        NavigationLink(value: user){
                            HStack {
                                CircularProfileImageView(user: user, size: .small)
                                    
                                VStack(alignment:.leading){
                                    Text(user.username)
                                        .fontWeight(.semibold)
                                    if let fullname = user.fullname{
                                        Text(fullname)
                                    }
                                }
                                .font(.footnote)
                                Spacer()
                            }
                            .foregroundColor(Color.black)
                            .padding(.horizontal)
                            .padding(.leading,10)
                        }
                    }
                }
                .searchable(text:$searchtext, prompt: "search...")
                .padding(.top,8)
            }
            .navigationDestination(for: User.self, destination:{ user in
                ProfileView(user: user)
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchView_Preview: PreviewProvider {
    static var previews: some View{
        SearchView()
    }
}
