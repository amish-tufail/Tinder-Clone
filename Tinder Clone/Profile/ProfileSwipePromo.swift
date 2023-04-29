//
//  ProfileSwipePromo.swift
//  Tinder Clone
//
//  Created by Amish Tufail on 29/04/2023.
//

import SwiftUI

struct ProfileSwipePromo: View {
    var action: () -> ()
    var body: some View {
        VStack(spacing: 0.0) {
            tabView
            plusButton
        }
    }
}

struct ProfileSwipePromo_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSwipePromo() {
            //
        }
            .background(.yellow)
            .frame(height: 400.0)
    }
}

extension ProfileSwipePromo {
    var tabView: some View {
        TabView {
            VStack(spacing: 9.0) {
                Spacer()
                Text("Get Tinder Gold")
                    .font(.system(size: 26.0, weight: .semibold))
                Text("See who Likes You & more!")
            }
            .padding(.bottom, 64.0)
            VStack(spacing: 9.0) {
                Spacer()
                Text("Get Matches Faster")
                    .font(.system(size: 26.0, weight: .semibold))
                Text("Boost your profile once a month!")
            }
            .padding(.bottom, 64.0)
            VStack(spacing: 9.0) {
                Spacer()
                Text("Increase Your Chances")
                    .font(.system(size: 26.0, weight: .semibold))
                Text("Boost your profile once a month!")
            }
            .padding(.bottom, 64.0)
        }
        .tabViewStyle(.page(indexDisplayMode: .automatic))
    }
    
    var plusButton: some View {
        Button {
            
        } label: {
            Text("My tiner Plus".uppercased())
                .foregroundColor(.red)
                .font(.system(size: 18.0, weight: .semibold))
                .padding(.vertical, 20.0)
                .padding(.horizontal, 50.0)
                .background(.white)
                .cornerRadius(30.0)
                .shadow(color: .gray.opacity(0.2), radius: 20.0)
                .padding(.horizontal)
        }
        .padding(.bottom, 30.0)
    }
}
