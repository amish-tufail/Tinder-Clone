//
//  Tinder_CloneApp.swift
//  Tinder Clone
//
//  Created by Amish Tufail on 29/04/2023.
//

import SwiftUI

@main
struct Tinder_CloneApp: App {
    @StateObject var manager: AppStateManager = AppStateManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(manager)
        }
    }
}
