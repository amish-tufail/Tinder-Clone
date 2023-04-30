//
//  MessageListDM.swift
//  Tinder Clone
//
//  Created by Amish Tufail on 30/04/2023.
//

import Foundation

class MessageListDM: ObservableObject {
    @Published var messagePreviews: [MessagePreview] = []
    
    init() {
        loadPreviews()
    }
    
    func loadPreviews() {
        self.messagePreviews = [MessagePreview.example]
    }
}
