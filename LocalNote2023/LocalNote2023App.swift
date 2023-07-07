//
//  LocalNote2023App.swift
//  LocalNote2023
//
//  Created by Ingo Wiederoder on 25.06.23.
//

import SwiftUI

@main
struct LocalNote2023App: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Label("Map", systemImage: "globe")
                    }
                OverviewView()
                    .tabItem {
                        Label("Overview", systemImage: "list.clipboard")
                    }
            }
        }
    }
}
