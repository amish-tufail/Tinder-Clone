//
//  UserManager.swift
//  Tinder Clone
//
//  Created by Amish Tufail on 30/04/2023.
//

import Foundation

class UserManager: ObservableObject {
    @Published var currentUser: User = User(name: "", age: 0, jobTitle: "")
    @Published var matches: [Person] = []
    @Published var topPicks: [Person] = []
    
    init() {
        loadUser()
        loadMatches()
        loadTopPicks()
    }
    
    func loadUser() {
        self.currentUser = User.example
    }
    
    func loadMatches() {
        matches = [Person.example, Person.example, Person.example, Person.example, Person.example, Person.example, Person.example, Person.example, Person.example]
    }
    
    func loadTopPicks() {
        topPicks = [Person.example, Person.example, Person.example, Person.example, Person.example, Person.example, Person.example, Person.example, Person.example].shuffled()
    }
}
