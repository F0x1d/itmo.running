//
//  ITMORunningApp.swift
//  ITMORunning
//
//  Created by Maksim Zoteev on 08.03.2024.
//

import SwiftUI
import SwiftData
import Data

@main
struct ITMORunningApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Training.self)
        }
    }
}
