//
//  ChatView.swift
//  Tinder Clone
//
//  Created by Amish Tufail on 29/04/2023.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var chatManager: ChatManager
    private var person: Person
    @State private var typeMessage: String = ""
    @State private var animate: Bool = false
    @State private var scrollProxy: ScrollViewProxy? = nil
    
    init(person: Person) {
        self.person = person
        self.chatManager = ChatManager(person: person)
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                Spacer().frame(height: 80.0)
                messagesList
                textField
            }
            ChatViewHeader(name: person.name, imageURL: person.imagURLS.first) {}
            .padding(.top, 10.0)
        }
        .onChange(of: chatManager.keyboardIsShowing) { value in
            if value {
                scrollToBottom()
            } 
        }
        .onChange(of: chatManager.messages) { _ in
            scrollToBottom()
        }
    }
    
    func sendMessgage() {
        withAnimation(.easeInOut) {
            chatManager.sendMessage(Message(content: typeMessage))
            animate = true
            typeMessage = ""
        }
    }
    
    func scrollToBottom() {
        withAnimation(.easeInOut) {
            scrollProxy?.scrollTo(chatManager.messages.count - 1, anchor: .bottom)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(person: Person.example)
    }
}

extension ChatView {
    var messagesList: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ScrollViewReader { proxy in
                LazyVStack(spacing: 0.0) {
                    ForEach(chatManager.messages.indices, id: \.self) { index in
                        let message = chatManager.messages[index]
                        MessageView(message: message)
                            .transition(.move(edge: .trailing))
                            .id(index)
                    }
                }
                .onAppear {
                    scrollProxy = proxy
                }
            }
        }
    }
    
    var textField: some View {
        ZStack(alignment: .trailing) {
            Color.textFieldBG
            TextField("Type a message", text: $typeMessage)
                .foregroundColor(.textPrimary)
                .textFieldStyle(.plain)
                .frame(height: 45.0)
                .padding(.horizontal)
            Button {
                sendMessgage()
            } label: {
                Text("Send")
                    .fontWeight(.semibold)
            }
            .padding(.horizontal)
            .foregroundColor(typeMessage.isEmpty ? .gray : .blue)
            .disabled(typeMessage.isEmpty)
        }
        .frame(height: 40.0)
        .cornerRadius(20.0)
        .overlay {
            RoundedRectangle(cornerRadius: 20.0, style: .continuous)
                .stroke(.gray.opacity(0.3), lineWidth: 1.0)
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
}
