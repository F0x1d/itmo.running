//
//  ViewModelsModule.swift
//  ITMORunning
//
//  Created by Maksim Zoteev on 17.03.2024.
//

import Foundation
import Factory

@MainActor extension Container {
    var contentViewModel: Factory<ContentViewModel> {
        self { ContentViewModel() }
    }
}
