//
//  Message.swift
//  Tinder Clone
//
//  Created by Amish Tufail on 29/04/2023.
//

import Foundation

struct Message: Hashable {
    
    var content: String
    var person: Person? = nil
    
    var fromCurrentUser: Bool {
        return person == nil
    }
}

extension Message {
    static let exampleSent = Message(content: "Hello there!")
    static let exampleReceived = Message(content: "Hi there!", person: Person.example)
}
