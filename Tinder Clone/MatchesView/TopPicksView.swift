//
//  TopPicksView.swift
//  Tinder Clone
//
//  Created by Amish Tufail on 30/04/2023.
//

import SwiftUI

struct TopPicksView: View {
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

struct TopPicksView_Previews: PreviewProvider {
    static var previews: some View {
        LikesView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}

extension TopPicksView {
    
    var headerText: some View {
        Text("Upgrade to Tinder Gold for more Top Picks!")
            .multilineTextAlignment(.center)
            .lineLimit(2)
            .foregroundColor(.textTitle)
            .font(.system(size: 16.0, weight: .medium))
            .padding(.horizontal, 40.0)
            .padding(.vertical, 24.0)
    }
    
    var feed: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20.0, pinnedViews: []) {
            ForEach(userManager.topPicks.indices) { index in
                PersonSquare(person: userManager.topPicks[index], blur: false)
                    .frame(height: 240.0)
                    .onTapGesture {
                        personTapped(userManager.topPicks[index])
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
