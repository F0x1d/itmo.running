//
//  ITMORunningApp.swift
//  ITMORunning
//
//  Created by Maksim Zoteev on 08.03.2024.
//

import SwiftUI
import SwiftData
import CoreDI
import Data

@main
@MainActor struct ITMORunningApp: App {
    
    @State private var container = di.modelContainer()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(container)
        }
    }
}
