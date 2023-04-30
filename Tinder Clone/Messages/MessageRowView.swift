//
//  MessageRowView.swift
//  Tinder Clone
//
//  Created by Amish Tufail on 30/04/2023.
//

import SwiftUI

struct MessageRowView: View {
    var preview: MessagePreview
    var body: some View {
        HStack {
            AsyncImage(url: preview.person.imagURLS.first!)
                .frame(width: 90.0, height: 90.0)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 8.0) {
                Text(preview.person.name)
                    .font(.system(size: 21.0, weight: .semibold))
                Text(preview.lastMessage)
                    .foregroundColor(.textPrimary)
                    .lineLimit(1)
                    .multilineTextAlignment(.leading)
            }
            Spacer()
        }
        .padding()
    }
}

struct MessageRowView_Previews: PreviewProvider {
    static var previews: some View {
        MessageRowView(preview: MessagePreview.example)
    }
}
