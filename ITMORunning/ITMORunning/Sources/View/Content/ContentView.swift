//
//  ContentView.swift
//  ITMORunning
//
//  Created by Maksim Zoteev on 08.03.2024.
//

import SwiftUI
import FeatureWelcome
import FeatureHistory
import FeatureTrack
import FeatureSettings
import Factory

struct ContentView: View {
    
    @InjectedObject(\.contentViewModel) private var viewModel
    
    @InjectedObject(\.welcomeStore) private var welcomeStore
        
    var body: some View {
        Group {
            if welcomeStore.welcomed {
                content
            } else {
                WelcomeView()
            }
        }
    }
    
    private var content: some View {
        Group {
            if viewModel.locationPermissionAvailable {
                TabView(selection: $viewModel.currentTab) {
                    HistoryView()
                        .tag(ContentViewTab.history)
                        .tabItem {
                            Label("history", systemImage: "clock")
                        }
                    
                    TrackView()
                        .tag(ContentViewTab.track)
                        .tabItem {
                            Label("track", systemImage: "location.north.line")
                        }
                    
                    SettingsView()
                        .tag(ContentViewTab.settings)
                        .tabItem {
                            Label("settings", systemImage: "wand.and.stars")
                        }
                }
            } else {
                NoPermissionView()
            }
        }
    }
}

#Preview {
    ContentView()
}
