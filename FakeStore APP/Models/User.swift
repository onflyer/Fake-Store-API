//
//  User.swift
//  FakeStore APP
//
//  Created by Aleksandar Milidrag on 1/13/24.
//

import Foundation

struct User: Codable {
    var name: String
    var email: String
    var password: String
    var avatar: String
    
    init(name: String, email: String, password: String, avatar: String = "https://api.multiavatar.com/\(Int.random(in: 0...1000)).png" ) {
        self.name = name
        self.email = email
        self.password = password
        self.avatar = avatar
    }
    
    var avatarUrl: URL {
        return URL(string: "https://api.multiavatar.com/\(name).png")!
    }
}



