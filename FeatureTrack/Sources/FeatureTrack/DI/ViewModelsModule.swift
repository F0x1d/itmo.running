//
//  ViewModelsModule.swift
//
//
//  Created by Maksim Zoteev on 19.04.2024.
//

import Foundation
import Factory

@MainActor extension Container {
    var trackViewModel: Factory<TrackViewModel> {
        self { TrackViewModel() }
    }
}
