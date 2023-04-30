//
//  AppStateManager.swift
//  Tinder Clone
//
//  Created by Amish Tufail on 29/04/2023.
//

import Foundation


class AppStateManager: ObservableObject {
    @Published var selectedTab: TabBarButtonType = .fire
    @Published var showPersonsProfile: Person? = nil
    @Published var showPurchasePopup: Bool = false
    
    public func showPersonsProfile(_ person: Person) {
        self.showPersonsProfile = person
    }
    
    public func showPurchaseScreen() {
        self.showPurchasePopup = true
    }
}
