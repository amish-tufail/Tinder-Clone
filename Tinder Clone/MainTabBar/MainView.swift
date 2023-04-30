//
//  MainView.swift
//  Tinder Clone
//
//  Created by Amish Tufail on 29/04/2023.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var appState: AppStateManager
    
    func correctViewForState() -> some View {
        switch appState.selectedTab {
        case .fire:
            return AnyView(Text("Fire")) // AnyView means it can any type of view
        case .star:
            return AnyView(Color.red)
        case .message:
            return AnyView(MessageListView())
        case .profile:
            return AnyView(ProfileView())
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.defaultBackground.ignoresSafeArea()
                views
            }
            .modifier(HideNavigationView())
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(AppStateManager())
    }
}

extension MainView {
    var views: some View {
        VStack {
            HStack {
                Spacer()
                TabBarButtonView(type: .fire)
                Spacer()
                TabBarButtonView(type: .star)
                Spacer()
                TabBarButtonView(type: .message)
                Spacer()
                TabBarButtonView(type: .profile)
                Spacer()
            }
            .frame(height: 100.0)
            .padding(.top, 30.0)
            correctViewForState()
            Spacer()
        }
        .ignoresSafeArea()
    }
}
