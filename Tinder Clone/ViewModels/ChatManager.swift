//
//  ChatManager.swift
//  Tinder Clone
//
//  Created by Amish Tufail on 29/04/2023.
//

import Foundation
import Combine
import UIKit

class ChatManager: ObservableObject {
    @Published var messages: [Message] = []
    @Published var keyboardIsShowing: Bool = false
    var cancellable: AnyCancellable? = nil // To store all the subscriptions
    private var person: Person
    
    init(person: Person) {
        self.person = person
        loadMessages()
        setupPublishers()
    }
    
    public func sendMessage(_ message: Message) {
        messages.append(message)
    }
    
    private let keyboardWillShow = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillShowNotification)
        .map({ _ in true })
    
    private let keyboardWillHide = NotificationCenter.default
        .publisher(for: UIResponder.keyboardDidHideNotification)
        .map({ _ in false })
    
    private func setupPublishers() {
        cancellable = Publishers.Merge(keyboardWillShow, keyboardWillHide)
            .subscribe(on: DispatchQueue.main)
            .assign(to: \.keyboardIsShowing, on: self)
    }
    
    private func loadMessages() {
        messages = [Message.exampleSent, Message.exampleReceived]
    }
    
    deinit {
        cancellable?.cancel()
    }
}
