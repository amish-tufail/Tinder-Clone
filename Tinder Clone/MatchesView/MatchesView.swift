//
//  MatchesView.swift
//  Tinder Clone
//
//  Created by Amish Tufail on 30/04/2023.
//

import SwiftUI

struct MatchesView: View {
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var appState: AppStateManager
    @State private var selectedTab: LikedTab = .likes
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0.0) {
                header
                Divider().padding(.vertical, 14.0)
                viewToShow
                Spacer()
            }
            bottomButton
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct MatchesView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesView()
            .environmentObject(UserManager())
    }
}

extension MatchesView {
    
    var header: some View {
        HStack {
            Spacer()
            Button {
                selectedTab = .likes
            } label: {
                Text("\(userManager.matches.count) Likes")
                    .font(.system(size: 22.0, weight: .semibold))
                    .if(selectedTab == .topPicks) {
                        $0.foregroundColor(.textPrimary)
                    }
            }
            .buttonStyle(.plain)
            Spacer()
            Button {
                selectedTab = .topPicks
            } label: {
                Text("\(userManager.topPicks.count) Top Picks")
                    .font(.system(size: 22.0, weight: .semibold))
                    .if(selectedTab == .likes) {
                        $0.foregroundColor(.textPrimary)
                    }
            }
            .buttonStyle(.plain)
            Spacer()
        }
    }
    
    var viewToShow: some View {
        if selectedTab == .likes {
           return AnyView(LikesView())
        } else {
            return AnyView(TopPicksView())
        }
    }
    
    var bottomButton: some View {
        Button {
            buttonAction()
        } label: {
            Text(selectedTab == .likes ? "See who likes you".uppercased() : "Unlock Top Picks".uppercased())
                .padding(.vertical, 14.0)
                .padding(.horizontal, 36.0)
                .font(.system(size: 22.0, weight: .bold))
                .foregroundColor(.white)
                .background(.yellow)
                .cornerRadius(30.0)
        }
        .buttonStyle(.plain)
        .padding(.bottom, 40.0)
    }
    
    func buttonAction() {
        appState.showPurchaseScreen()
    }
}

enum LikedTab {
    case likes
    case topPicks
}

