//
//  CardImageScroller.swift
//  Tinder Clone
//
//  Created by Amish Tufail on 06/05/2023.
//

import SwiftUI

struct CardImageScroller: View {
    var person: Person
    @State private var imageIndex: Int = 0
    
    func updateImageIndex(addition: Bool) {
        let newIndex: Int
        if addition {
            newIndex = imageIndex + 1
        } else {
            newIndex = imageIndex - 1
        }
        imageIndex = min(max(0, newIndex), person.imagURLS.count - 1)
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                ZStack {
                    AsyncImage(url: person.imagURLS[imageIndex])
                        .scaledToFill()
                        .frame(width: proxy.size.width, height: proxy.size.height)
                        .clipped()
                    HStack {
                        Rectangle()
                            .onTapGesture {
                                updateImageIndex(addition: false)
                            }
                        Rectangle()
                            .onTapGesture {
                                updateImageIndex(addition: true)
                            }
                    }
                    .foregroundColor(Color.white.opacity(0.01))
                }
                VStack {
                    HStack {
                        ForEach(0 ..< person.imagURLS.count) { index in
                            RoundedRectangle(cornerRadius: 20.0)
                                .frame(height: 4.0)
                                .foregroundColor(imageIndex == index ? .white : .gray.opacity(0.5))
                        }
                    }
                    .padding(.top, 6.0)
                    .padding(.horizontal, 12.0)
                    Spacer()
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(person.name)
                                    .font(.system(size: 32, weight: .heavy))
                                Text("21")
                                    .font(.system(size: 28, weight: .light))
                            }
                            Text("This is my bio, This is my bio, This is my bio, This is my bio, This is my bio, This is my bio, This is my bio")
                                .font(.system(size: 18, weight: .medium))
                                .lineLimit(2)
                        }
                        Spacer()
                        Button {
                            
                        } label: {
                            Image(systemName: "info.circle.fill")
                                .font(.system(size: 26.0, weight: .medium))
                        }
                    }
                    .padding(16.0)
                }
                .foregroundColor(.white)
            }
            .cornerRadius(6.0)
            .shadow(radius: 5.0)
        }
    }
}

struct CardImageScroller_Previews: PreviewProvider {
    static var previews: some View {
        CardImageScroller(person: Person.example)
    }
}
