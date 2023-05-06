//
//  Person.swift
//  Tinder Clone
//
//  Created by Amish Tufail on 29/04/2023.
//

import Foundation

struct Person: Hashable {
    var name: String
    var imagURLS: [URL]
}

extension Person {
    static let example = Person(name: "Alex", imagURLS: [URL(string: "https://picsum.photos/800")!, URL(string: "https://picsum.photos/800")!, URL(string: "https://picsum.photos/800")!, URL(string: "https://picsum.photos/800")!])
}
