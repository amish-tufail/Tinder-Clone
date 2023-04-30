//
//  User.swift
//  Tinder Clone
//
//  Created by Amish Tufail on 30/04/2023.
//

import Foundation

struct User {
    var name: String
    var age: Int
    var jobTitle: String
    var goalSubscriber: Bool = false
    var imageURLS: [URL] = []
}


extension User {
    static let example = User(name: "Alex", age: 21, jobTitle: "Software Engineer", goalSubscriber: false, imageURLS: [URL(string: "https://picsum.photos/400")!])
}
