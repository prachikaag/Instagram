//
//  CreatePasswordView.swift
//  Instagram
//
//  Created by PRACHIKA AGARWAL on 10/04/24.
//

import SwiftUI

struct CreatePasswordView: View {
    @EnvironmentObject var viewmodel: RegistrationViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing:15){
            VStack(spacing:3){
                Text("Create a password")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.top)
                Text("Your password must be atleast 6 characters in length")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,24)
            }
                    
            SecureField("Enter your password", text: $viewmodel.password)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .modifier(IGTextfieldModifier())
                .padding(.top)
                    
            NavigationLink{
                CompleteSignUpView()
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

struct CreatePasswordView_Preview: PreviewProvider {
    static var previews: some View{
        CreatePasswordView()
    }
}
