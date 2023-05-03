//
//  PurchaseOptionView.swift
//  Tinder Clone
//
//  Created by Amish Tufail on 03/05/2023.
//

import SwiftUI

struct PurchaseOptionView: View {
    var sub: Subscription
    var isSelected: Bool
    var body: some View {
        VStack(spacing: 0.0) {
            Text("\(sub.month)")
                .font(.system(size: 44.0, weight: .light))
            Spacer().frame(height: 2.0)
            Text("month\(sub.month > 1 ? "s" : "")")
                .if(isSelected) {
                    $0.font(.system(size: 14.0, weight: .bold))
                }
            Spacer().frame(height: 2.0)
            Text("$\(String(format: "%.2f", sub.monthlyCost))/mo")
                .foregroundColor(.textPrimary)
            Spacer().frame(height: 10.0)
            if sub.savePercent != nil {
                Text("\("Save".uppercased()) \(sub.savePercent ?? 0)%")
                    .foregroundColor(.yellow)
                    .font(.system(size: 16.0, weight: .heavy))
                    .frame(height: 22.0)
            } else {
                Spacer().frame(height: 22.0)
            }
            Spacer().frame(height: 12.0)
            Text("$\(String(format: "%.2f", sub.totalCost))")
                .font(.system(size: 20.0, weight: .bold))
        }
        .padding(.horizontal, 12.0)
        .padding(.vertical, 18.0)
        .if(!isSelected) {
            $0.foregroundColor(.textPrimary)
        }
        .if(isSelected && sub.tagLine == .none) {
            $0.overlay {
                RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                    .stroke(.yellow, lineWidth: 1.5)
            }
        }
        .if(isSelected && sub.tagLine != .none) {
            $0.overlay {
                ZStack(alignment: .top) {
                    Rectangle()
                        .foregroundColor(.yellow)
                        .frame(height: 20.0)
                        .cornerRadius(10.0, corners: [.topLeft, .topRight])
                    Text(sub.tagLine.rawValue)
                        .font(.system(size: 12.0, weight: .bold))
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .padding(.top, 2)
                        .padding(.horizontal, 6.0)
                        .minimumScaleFactor(0.1)
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .stroke(.yellow, lineWidth: 1.5)
                }
            }
        }
    }
}

struct PurchaseOptionView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            PurchaseOptionView(sub: Subscription.example1, isSelected: true)
            PurchaseOptionView(sub: Subscription.example2, isSelected: true)
            PurchaseOptionView(sub: Subscription.example3, isSelected: true)
        }
    }
}
