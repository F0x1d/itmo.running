//
//  ContentViewModel.swift
//  ITMORunning
//
//  Created by Maksim Zoteev on 17.03.2024.
//

import Foundation
import CoreArch
import SwiftUI
import Factory
import CoreLocation
import FeatureLocationApi

final class ContentViewModel: BaseViewModel {
    @Published var currentTab: ContentViewTab = .track
    @Published var locationPermissionAvailable = true
    
    @Injected(\.locationPermissionRepository) private var locationPermissionRepository
    @Injected(\.welcomeStore) private var welcomeStore
        
    override init() {
        super.init()
        
        locationPermissionRepository
            .observePermissionStatus(checkInitially: welcomeStore.welcomed)
            .sink { [weak self] granted in
                guard let self else { return }
                
                if welcomeStore.welcomed {
                    withAnimation { [weak self] in
                        self?.locationPermissionAvailable = granted
                    }
                }
            }
            .store(in: &compositeSubscription)
    }
}

enum ContentViewTab: Hashable {
    case history, track, settings
}
