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

final class NoPermissionViewModel: BaseViewModel {
        
    @Injected(\.location) private var location
    @Injected(\.navigator) private var navigator
    
    override init() {
        super.init()
        
        Task { [weak self] in
            guard let self else { return }
                        
            let result = try? await location.requestPermission(.always)
            if result == .authorizedAlways {
                navigator.openReadyScreen()
            }
                        
            for await event in await location.startMonitoringAuthorization() {
                if case .authorizedAlways = event.authorizationStatus {
                    navigator.openReadyScreen()
                }
            }
        }
    }
    
    func openSettings() {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
    }
    
    deinit {
        NSLog("DIED")
    }
}
