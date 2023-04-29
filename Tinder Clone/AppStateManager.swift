//
//  AppStateManager.swift
//  Tinder Clone
//
//  Created by Amish Tufail on 29/04/2023.
//

import Foundation


class AppStateManager: ObservableObject {
    @Published var selectedTab: TabBarButtonType = .fire
}
