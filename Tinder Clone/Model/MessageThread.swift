//
//  MessageThread.swift
//  Tinder Clone
//
//  Created by Amish Tufail on 29/04/2023.
//

import Foundation

struct MessagePreview: Hashable {
    var person: Person
    var lastMessage: String
}

extension MessagePreview {
    static let example = MessagePreview(person: Person.example, lastMessage: "Hello there!")
}
