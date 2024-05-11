//
//  NoPermissionViewModel.swift
//
//
//  Created by Maksim Zoteev on 10.03.2024.
//

import Foundation
import SwiftUI
import CoreArch
import CoreLocation
import SwiftLocation
import CoreDI
import Factory
import FeatureLocationApi

final class NoPermissionViewModel: BaseViewModel {
        
    @Injected(\.location) private var location
    @Injected(\.navigator) private var navigator
    
    @Injected(\.locationPermissionStore) private var locationPermissionStore
    
    override init() {
        super.init()
        
        Task { [weak self] in
            guard let self else { return }
            
            locationPermissionStore
                .permissionGranted
                .sink { [weak self] granted in
                    if granted {
                        self?.navigator.openReadyScreen()
                    }
                }
                .store(in: &compositeSubscription)
        }
    }
    
    func openSettings() {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
    }
}
