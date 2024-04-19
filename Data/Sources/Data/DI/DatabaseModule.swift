//
//  DatabaseModule.swift
//
//
//  Created by Maksim Zoteev on 19.04.2024.
//

import Foundation
import Factory
import SwiftData

@MainActor public extension Container {
    var modelContainer: Factory<ModelContainer> {
        self { try! ModelContainer(for: Training.self) }.singleton
    }
    
    var modelContext: Factory<ModelContext> {
        self { self.modelContainer().mainContext }
    }
}
