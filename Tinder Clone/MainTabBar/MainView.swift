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
            return AnyView(Color.yellow)
        case .profile:
            return AnyView(Text("Fire"))
        }
    }
    var body: some View {
        ZStack {
            Color(.systemGray6).opacity(0.35).ignoresSafeArea()
            
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
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(AppStateManager())
    }
}
