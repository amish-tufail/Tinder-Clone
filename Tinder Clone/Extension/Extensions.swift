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
