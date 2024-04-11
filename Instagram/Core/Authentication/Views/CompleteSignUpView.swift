//
//  CompleteSignUpView.swift
//  Instagram
//
//  Created by PRACHIKA AGARWAL on 10/04/24.
//

import SwiftUI

struct CompleteSignUpView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewmodel: RegistrationViewModel
    var body: some View {
        VStack(spacing:15){
            VStack(spacing:3){
                Text("Welcome to Instagram as \(viewmodel.username)")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.top)
                Text("Click below to complete registration and start using Instagram")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,24)
            }
                    
            Button{
                Task {try await viewmodel.createUser() }
            } label:{
                Text("Complete Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 64)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
                }
            .padding(.vertical)
            }
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
        
    }
}

struct CompleteSignUpView_Preview: PreviewProvider {
    static var previews: some View{
        CompleteSignUpView()
    }
}
