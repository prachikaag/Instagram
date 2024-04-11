//
//  CreateUserNameView.swift
//  Instagram
//
//  Created by PRACHIKA AGARWAL on 10/04/24.
//

import SwiftUI

struct CreateUserNameView: View {
    @EnvironmentObject var viewmodel: RegistrationViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing:12){
            VStack(spacing:3){
                Text("Create username")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                Text("Pick a unique username to get started with your account")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,24)
            }
                    
            TextField("Create your username", text: $viewmodel.username)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .modifier(IGTextfieldModifier())
                .padding(.top)
            NavigationLink{
                CreatePasswordView()
                    .navigationBarBackButtonHidden()
            } label:{
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 64)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
            }
            .padding(.vertical)
            Spacer()
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

struct CreateUserNameView_Preview: PreviewProvider {
    static var previews: some View{
        CreateUserNameView()
    }
}
