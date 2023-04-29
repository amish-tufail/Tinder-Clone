//
//  MessageView.swift
//  Tinder Clone
//
//  Created by Amish Tufail on 29/04/2023.
//

import SwiftUI

struct MessageView: View {
    var message: Message
    var body: some View {
        HStack {
            if message.fromCurrentUser {
                Spacer()
            }
            messageView
            if !message.fromCurrentUser {
                Spacer()
            }
        }
        .padding()
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: Message.exampleSent)
    }
}

extension MessageView {
    var messageView: some View {
        Text(message.content)
            .padding(10.0)
            .foregroundColor(message.fromCurrentUser ? .white : .black)
            .background(message.fromCurrentUser ? .blue : Color(.systemGray4))
            .cornerRadius(.infinity)
    }
}
