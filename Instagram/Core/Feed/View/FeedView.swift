//
//  FeedView.swift
//  Instagram
//
//  Created by PRACHIKA AGARWAL on 10/04/24.
//

import SwiftUI

struct FeedView: View {
    
    @StateObject var viewmodel = FeedViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack(spacing: 32){
                    ForEach(viewmodel.posts) { post in
                        FeedCellView(post: post)
                    }
                }
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Image("instagram")
                        .resizable()
                        .frame(width: 100,height: 40)
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Image(systemName: "paperplane")
                        .resizable()
                }
            }
        }
    }
}

struct FeedView_Preview: PreviewProvider {
    static var previews: some View{
        FeedView()
    }
}
