//
//  Extensions.swift
//  Tinder Clone
//
//  Created by Amish Tufail on 29/04/2023.
//

import SwiftUI


extension View {
    @ViewBuilder
    func `if`<Transform: View>( _ condition: Bool, transform: (Self) -> Transform) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

extension Color {
    static let textPrimary = Color.gray.opacity(0.9)
    static let textTitle = Color.black.opacity(0.8)
    static let defaultBackground = Color(.systemGray6).opacity(0.35)
    static let textSecondary = Color(.gray).opacity(0.6)
    static let textFieldBG = Color(.systemGray6)
}


extension View {
    func endEditing(_ force: Bool) {
        UIApplication.shared.windows.forEach {
            $0.endEditing(force)
        }
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct HideNavigationView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationTitle("")
            .navigationBarBackButtonHidden(true)
    }
}
