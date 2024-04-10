//
//  Posts.swift
//  Instagram
//
//  Created by PRACHIKA AGARWAL on 10/04/24.
//

import Foundation

struct Post: Identifiable,Hashable,Codable{
    let id: String
    var owneruid: String
    var capion: String
    var likes: Int
    var imageurl: String
    var timestamp: Date
    var user: User? //optional property
}
extension Post{
    static var MOCK_POSTS:[Post] = [
        .init(id: NSUUID().uuidString,
              owneruid: NSUUID().uuidString,
              capion:"Batman here",
              likes: 104,
              imageurl: "batman",
              timestamp: Date(),
              user: User.MOCK_USRS[0]),
        .init(id: NSUUID().uuidString,
              owneruid: NSUUID().uuidString,
              capion:"Ironman here",
              likes: 104,
              imageurl: "ironman",
              timestamp: Date(),
              user: User.MOCK_USRS[1]),
        .init(id: NSUUID().uuidString,
               owneruid: NSUUID().uuidString,
               capion:"Scarlet witch here",
               likes: 104,
               imageurl: "scarletwitch",
               timestamp: Date(),
               user: User.MOCK_USRS[2]),
        .init(id: NSUUID().uuidString,
              owneruid: NSUUID().uuidString,
              capion:"Harley Quinn here",
              likes: 104,
              imageurl: "harleyquinn",
              timestamp: Date(),
              user: User.MOCK_USRS[3]),
        .init(id: NSUUID().uuidString,
              owneruid: NSUUID().uuidString,
              capion:"Joker here",
              likes: 104,
              imageurl: "joker",
              timestamp: Date(),
              user: User.MOCK_USRS[4]),
        ]
    
    }
