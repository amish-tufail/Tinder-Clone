//
//  ChatViewHeader.swift
//  Tinder Clone
//
//  Created by Amish Tufail on 29/04/2023.
//

import SwiftUI

struct ChatViewHeader: View {
    @Environment(\.presentationMode) var pre
    let name: String
    let imageURL: URL?
    let videoAction: () -> ()
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea().shadow(radius: 3.0)
            header
            .padding(.horizontal, 22.0)
            .padding(.vertical, 10.0)
        }
        .frame(height: 50.0)
    }
}

struct ChatViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        let person = Person.example
        ChatViewHeader(name: person.name, imageURL: person.imagURLS.first) {
            //
        }
    }
}

extension ChatViewHeader {
    var header: some View {
        HStack {
            Button {
                pre.wrappedValue.dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(.textPrimary)
                    .font(.system(size: 28.0, weight: .semibold))
            }
            Spacer()
            VStack(spacing: 6.0) {
               AsyncImage(url: imageURL)
                    .scaledToFit()
                    .frame(width: 50.0, height: 50.0)
                    .clipShape(Circle())
                Text(name)
                    .foregroundColor(.textPrimary)
                    .font(.system(size: 14.0))
            }
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "video.fill")
                    .font(.system(size: 20.0, weight: .bold))
            }
        }
    }
}
