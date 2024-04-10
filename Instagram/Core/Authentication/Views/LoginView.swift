//
//  LoginView.swift
//  Instagram
//
//  Created by PRACHIKA AGARWAL on 10/04/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Image("instagram")
                    .resizable()
                    .frame(width: 220,height: 100)
                    .scaledToFit()
                
                //Form fields
                VStack{
                    TextField("Enter your email",text:$email)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .modifier(IGTextfieldModifier())
                    SecureField("Enter your password",text:$password)
                        .modifier(IGTextfieldModifier())
                    Button{
                        print("Forgot passeword")
                    } label:{
                        Text("Forgot password?")
                            .font(.footnote)
                            .padding(10)
                            .padding(.horizontal,24)
                    
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                    
                    //Sign in button
                    
                    Button{
                        print("Sign in clicked")
                    } label:{
                        Text("Sign In")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .padding(10)
                            .padding(.horizontal,24)
                            .frame(width: 360, height: 44)
                            .background(Color(.systemBlue))
                            .cornerRadius(10)
                    }
                    .padding(.vertical)
                    
                    HStack{
                        Rectangle()
                            .frame(width:(UIScreen.main.bounds.width/2)-40, height: 0.5)
                        Text("or")
                            .fontWeight(.semibold)
                            .font(.footnote)
                        Rectangle()
                            .frame(width:(UIScreen.main.bounds.width/2)-40, height: 0.5)
                    }
                    .foregroundColor(.gray)
                    
                    HStack{
                        Image("facebook-logo")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        Text("Continue with Facebook")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(.systemBlue))
                    }
                    .padding(.top,8)
                    Spacer()
                    
                    Divider()
                    
                    NavigationLink{
                        AddEmailView()
                            .navigationBarBackButtonHidden(true )
                    } label:{
                        HStack(spacing: 3){
                            Text("Don't have an account?")
                            Text("Sign Up")
                                .fontWeight(.semibold)
                        }
                    }
                    .font(.footnote)
                }
                .padding(.vertical,15)
            }
        }
    }
}

struct LoginView_Preview: PreviewProvider {
    static var previews: some View{
        LoginView()
    }
}
