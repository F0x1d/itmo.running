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
    
    @Injected(\.locationPermissionRepository) var locationPermissionRepository
    
    override init() {
        super.init()
        
        locationPermissionRepository.permissionGrantedPublisher()
            .sink { [weak self] granted in
                withAnimation {
                    self?.locationPermissionAvailable = granted
                }
            }
            .store(in: &compositeSubscription)
    }
    
    func checkPermission() {
        let _ = locationPermissionRepository.isLocationPermissionAvailable()
    }
}
