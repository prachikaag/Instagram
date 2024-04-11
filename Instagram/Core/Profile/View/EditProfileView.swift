//
//  EditProfileView.swift
//  Instagram
//
//  Created by PRACHIKA AGARWAL on 11/04/24.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss

    @StateObject var viewmodel: EditProfileViewModel
    
    init(user: User){
        self._viewmodel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
    var body: some View {
        VStack{
            //toolbar
            VStack{
                HStack{
                    Button("Cancel"){
                        dismiss()
                    }
                    Spacer()
                    
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button{
                        Task{ try await viewmodel.updateUserData() }
                    } label: {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                }
                .padding(.horizontal)
                
                Divider()
            }
            // edit profile pic
            
            PhotosPicker(selection: $viewmodel.selectedImage){
                VStack{
                    if let image = viewmodel.profileImage{
                        image
                            .resizable()
                            .foregroundColor(.white)
                            .background(.gray)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .frame(width: 80, height: 80)
                    } else {
                        Image(systemName: "person")
                            .resizable()
                            .foregroundColor(.white)
                            .background(.gray)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .frame(width: 80, height: 80)
                    }
                    
                    Text("Edit profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Divider()
                }
            }
            .padding(.vertical,8)
            
            // name and bio 
            
            VStack{
                EditProfileRowView(title: "Name", placeholder: "Enter your name", text: $viewmodel.fullname)
                EditProfileRowView(title: "Bio", placeholder: "Enter your bio", text: $viewmodel.bio)
            }
            
            Spacer()
        }
    }
}
struct EditProfileRowView: View{
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View{
        HStack{
            Text(title)
                .padding(.leading,8)
                .frame(width:100,alignment: .leading)
            VStack{
                TextField(placeholder, text:$text)
                
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 36)
    }
}
struct EditProfileView_Preview: PreviewProvider {
    static var previews: some View{
        EditProfileView(user: User.MOCK_USRS[2])
    }
}
