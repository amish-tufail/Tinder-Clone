//
//  ProfileView.swift
//  Tinder Clone
//
//  Created by Amish Tufail on 29/04/2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var appState: AppStateManager
    
    var user: User {
        return userManager.currentUser
    }
    
    var body: some View {
        VStack(spacing: 0.0) {
            topSection
            Spacer().frame(height: 18.0)
            detailSection
            Spacer().frame(height: 22.0)
            buttonSection
            Spacer().frame(height: 14.0)
            tipView
            Spacer().frame(height: 18.0)
            swipeView
            Spacer()
        }
        .foregroundColor(.black.opacity(0.75))
        .ignoresSafeArea(edges: .bottom)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}

extension ProfileView {
    var topSection: some View {
        ZStack(alignment: .topTrailing) {
            RoundedImage(url: user.imageURLS.first)
            Button {
                
            } label: {
                Image(systemName: "pencil")
                    .font(.system(size: 10.0, weight: .heavy, design: .rounded))
                    .foregroundColor(.gray.opacity(0.5))
                    .frame(width: 32.0, height: 32.0)
                    .imageScale(.large)
                    .background(.white)
                    .clipShape(Circle())
                    .shadow(radius: 6.0)
                
            }
            .padding(.vertical, 10.0)
            .offset(x: -10.0)
        }
    }
    
    var detailSection: some View {
        Group {
            Text("\(user.name), \(user.age)")
                .foregroundColor(.textTitle)
                .font(.system(size: 26.0, weight: .medium))
            Spacer().frame(height: 8.0)
            Text(user.jobTitle)
        }
    }
    
    var buttonSection: some View {
        HStack(alignment: .top) {
            Spacer()
            ProfileButton(icon: "gearshape.fill", title: "Settings", size: 42.0, paddingSize: 22.0, color: .gray.opacity(0.5), backColor: .white)
            Spacer()
            ProfileButton(icon: "camera.fill", title: "Add Media", size: 58.0, paddingSize: 22.0, color: .white, backColor: .red)
            Spacer()
            ProfileButton(icon: "shield.fill", title: "Safety", size: 40.0, paddingSize: 22.0, color: .gray.opacity(0.5), backColor: .white)
            Spacer()
        }
    }
    
    var tipView: some View {
        HStack {
            Text("Photo Tip: Make waves with a beach photo and get more likes")
                .multilineTextAlignment(.leading)
                .lineLimit(3)
                .foregroundColor(.white)
                .font(.system(size: 14.0))
            Button {
                
            } label: {
                Image(systemName: "plus")
                    .imageScale(.medium)
                    .foregroundColor(.pink)
                    .font(.system(size: 12.0, weight: .heavy))
            }
            .padding(6.0)
            .background(.white)
            .clipShape(Circle())
        }
        .padding()
        .background(.pink)
        .cornerRadius(12.0)
        .padding(.horizontal)
    }
    
    var swipeView: some View {
        ZStack {
            Color.gray.opacity(0.18)
            ProfileSwipePromo() {
                appState.showPurchaseScreen()
            }
        }
    }
}


