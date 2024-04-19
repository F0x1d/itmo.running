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

final class ContentViewModel: BaseViewModel {
    @Published var currentTab: ContentViewTab = .track
    @Published var locationPermissionAvailable = false
    
    @Injected(\.location) private var location
    @Injected(\.welcomeStore) private var welcomeStore
        
    override init() {
        super.init()
        
        Task { [weak self] in
            guard let self else { return }
            
            if welcomeStore.welcomed {
                if let result = try? await location.requestPermission(.always) {
                    locationPermissionAvailable = result == .authorizedAlways
                }
            }
                        
            for await event in await location.startMonitoringAuthorization() {
                locationPermissionAvailable = event.authorizationStatus == .authorizedAlways
            }
        }
    }
}
