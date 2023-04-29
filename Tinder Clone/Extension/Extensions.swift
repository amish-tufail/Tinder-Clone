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
