//
//  PersonSquare.swift
//  Tinder Clone
//
//  Created by Amish Tufail on 30/04/2023.
//

import SwiftUI

struct PersonSquare: View {
    var person: Person
    var blur: Bool
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottomLeading) {
                image(proxy)
                nameAge
            }
            .cornerRadius(16.0)
        }
    }
}

struct PersonSquare_Previews: PreviewProvider {
    static var previews: some View {
        PersonSquare(person: Person.example, blur: true)
    }
}

extension PersonSquare {
    func image(_ proxy: GeometryProxy) -> some View {
        AsyncImage(url: person.imagURLS.first)
            .scaledToFill()
            .frame(width: proxy.size.width, height: proxy.size.height)
            .if(blur) {
                $0.blur(radius: 25.0)
            }
    }
    
    var nameAge: some View {
        Text("\(person.name), 21")
            .padding()
            .foregroundColor(.white)
            .font(.system(size: 18.0, weight: .semibold))
            .if(blur) {
                $0.redacted(reason: .placeholder)
            }
    }
}
