//
//  PurchasePopup.swift
//  Tinder Clone
//
//  Created by Amish Tufail on 03/05/2023.
//

import SwiftUI

struct PurchasePopup: View {
    @Binding var isVisible: Bool
    @State private var selectedIndex: Int = 1
    
    func processPayment() {
//        let producct = subscriptions[selectedIndex]
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Spacer().frame(height: 40.0)
                head(proxy)
                Spacer()
                bottom
                Spacer()
            }
            .background(Color.black.ignoresSafeArea())
            
        }
        .frame(height: UIScreen.main.bounds.height)
        
    }
}

struct PurchasePopup_Previews: PreviewProvider {
    static var previews: some View {
        PurchasePopup(isVisible: .constant(false))
    }
}

extension PurchasePopup {
    func head(_ proxy: GeometryProxy) ->  some View {
        VStack {
            Text("Get Tinder Gold")
                .foregroundColor(.yellow)
                .font(.system(size: 24.0, weight: .bold))
            PurchaseSwipsPromo()
                .frame(height: proxy.size.height / 3)
                .padding(.top, -35.0)
            HStack {
                ForEach(subscriptions.indices) { index in
                    let sub = subscriptions[index]
                    PurchaseOptionView(sub: sub, isSelected: index == selectedIndex)
                        .onTapGesture {
                            selectedIndex = index
                        }
                }
            }
            Button {
                processPayment()
            } label: {
                Text("Continue".uppercased())
                    .bold()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55.0)
                    .background(
                        RoundedRectangle(cornerRadius: 45.0, style: .continuous)
                    )
                    .padding(.horizontal, 24.0)
                    .padding(.vertical, 12.0)
            }
            .foregroundColor(.yellow)
            Button {
                isVisible = false
            } label: {
                Text("No Thanks".uppercased())
                    .foregroundColor(.textPrimary)
                    .font(.system(size: 20.0, weight: .heavy))
            }
            .padding(.vertical, 18.0)
        }
        .frame(width: proxy.size.width)
        .padding(.vertical, 20.0)
        .background(
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .foregroundColor(.white)
        )
    }
    
    var bottom: some View {
        VStack(spacing: 4.0) {
            Text("Recurring billing, cancel anytime.")
                .foregroundColor(.white)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ")
                .foregroundColor(.white.opacity(0.5))
                .font(.system(size: 14.0, weight: .semibold))
                .multilineTextAlignment(.center)
        }
        .padding(.bottom, 20.0)
        .padding(.horizontal, 4.0)
    }
}
