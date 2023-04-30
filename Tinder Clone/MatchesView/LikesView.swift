//
//  LikesView.swift
//  Tinder Clone
//
//  Created by Amish Tufail on 30/04/2023.
//

import SwiftUI

struct LikesView: View {
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var appState: AppStateManager
    private var user: User {
        return userManager.currentUser
    }
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if !user.goalSubscriber {
                headerText
            }
            feed
        }
    }
}

struct LikesView_Previews: PreviewProvider {
    static var previews: some View {
        LikesView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}

extension LikesView {
    
    var headerText: some View {
        Text("Upgrade to Gold to see people who already liked you.")
            .multilineTextAlignment(.center)
            .lineLimit(2)
            .foregroundColor(.textTitle)
            .font(.system(size: 16.0, weight: .medium))
            .padding(.horizontal, 40.0)
            .padding(.vertical, 24.0)
    }
    
    var feed: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20.0, pinnedViews: []) {
            ForEach(userManager.matches.indices) { index in
                PersonSquare(person: userManager.matches[index], blur: !user.goalSubscriber)
                    .frame(height: 240.0)
                    .onTapGesture {
                        personTapped(userManager.matches[index])
                    }
            }
            
        }
        .padding(.horizontal, 6.0)
    }
    
    func personTapped(_ person: Person) {
        if user.goalSubscriber {
            appState.showPersonsProfile(person)
        } else {
            appState.showPurchaseScreen()
        }
    }
}
