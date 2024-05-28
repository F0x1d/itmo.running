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
        
    @Injected(\.navigator) private var navigator
    @Injected(\.locationPermissionRepository) private var locationPermissionRepository
    
    override init() {
        super.init()
        
        var waiting = true
        
        locationPermissionRepository
            .observePermissionStatus()
            .prefix(
                while: { _ in waiting }
            )
            .sink { [weak self] granted in
                if granted {
                    waiting = false
                    self?.navigator.openReadyScreen()
                }
            }
            .store(in: &compositeSubscription)
    }
    
    func openSettings() {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
    }
}
