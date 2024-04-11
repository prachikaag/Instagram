//
//  User.swift
//  Instagram
//
//  Created by PRACHIKA AGARWAL on 10/04/24.
//

import Foundation
import Firebase

struct User: Identifiable,Hashable,Codable{
    let id: String
    var username: String
    var profileImageUrl: String?  //optional string
    var fullname: String?
    var bio: String?
    var email: String
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else {return false}
        return currentUid == id
    }
}

extension User{
    static var MOCK_USRS:[User] = [
        .init(id: NSUUID().uuidString, username: "batman_01", profileImageUrl: "batman",fullname: nil, bio: "My first app", email: "batman@nyu.edu"),
        .init(id: NSUUID().uuidString, username: "ironman_01", profileImageUrl: "ironman",fullname: "ironman", bio: "My first app", email: "ironman@nyu.edu"),
        .init(id: NSUUID().uuidString, username: "scarletwitch_01", profileImageUrl: "scarletwitch", fullname:"scarletwitch", bio: "My first app", email: "scarletwitch@nyu.edu"),
        .init(id: NSUUID().uuidString, username: "harleyquinn_01", profileImageUrl: "harleyquinn", fullname:"harleyquinn", bio: "My first app", email: "harleyquinn@nyu.edu"),
        .init(id: NSUUID().uuidString, username: "joker_01", profileImageUrl: "joker",fullname: "joker", bio: "My first app", email: "joker@nyu.edu"),
        ]
    }
