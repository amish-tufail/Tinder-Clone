//
//  PurchaseSwipsPromo.swift
//  Tinder Clone
//
//  Created by Amish Tufail on 03/05/2023.
//

import SwiftUI

struct PurchaseSwipsPromo: View {
    var body: some View {
        TabView {
            detail
            detail
            detail
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

struct PurchaseSwipsPromo_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseSwipsPromo()
            .frame(height: UIScreen.main.bounds.height / 3)
    }
}

extension PurchaseSwipsPromo {
    var detail: some View {
        VStack(spacing: 10.0) {
            Image(systemName: "thermometer.sun.fill")
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(height: 75.0)
            Text("25 people already like you!")
                .font(.system(size: 18.0, weight: .semibold))
            Text("Match with them instantly")
        }
    }
}
