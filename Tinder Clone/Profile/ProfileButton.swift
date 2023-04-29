//
//  ProfileButton.swift
//  Tinder Clone
//
//  Created by Amish Tufail on 29/04/2023.
//

import SwiftUI

struct ProfileButton: View {
    var icon: String
    var title: String
    var size: CGFloat
    var paddingSize: CFloat
    var color: Color
    var backColor: Color
    
    var body: some View {
        buttonView
    }
}

struct ProfileButton_Previews: PreviewProvider {
    static var previews: some View {
        ProfileButton(icon: "gearshape.fill", title: "settings", size: 38.0, paddingSize: 10.0, color: .gray.opacity(0.5), backColor: .white)
    }
}

extension ProfileButton {
    var buttonView: some View {
        Button {
        } label: {
            VStack {
                Image(systemName: icon)
                    .imageScale(.large)
                    .foregroundColor(color)
                    .padding(CGFloat(paddingSize))
                    .frame(height: size)
                    .background(backColor)
                    .clipShape(Circle())
                    .shadow(radius: 6.0)
                Text(title.uppercased())
                    .font(.system(size: 14.0, weight: .medium))
                    .foregroundColor(.textSecondary)
            }
        }
    }
}
