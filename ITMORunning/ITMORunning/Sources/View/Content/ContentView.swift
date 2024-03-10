//
//  ContentView.swift
//  ITMORunning
//
//  Created by Maksim Zoteev on 08.03.2024.
//

import SwiftUI
import FeatureWelcome
import Factory

struct ContentView: View {
    
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
        VStack {
            
        }
    }
}

#Preview {
    ContentView()
}
