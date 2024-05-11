//
//  LocationPermissionStore.swift
//
//
//  Created by Maksim Zoteev on 11.05.2024.
//

import Foundation
import CoreDI
import Combine
import Factory
import SwiftLocation

public final class LocationPermissionStore {
    public let permissionGranted = CurrentValueSubject<Bool, Never>(true)
    
    @Injected(\.location) private var location
    
    public init() {
        Task { @MainActor [weak self] in
            guard let self else { return }
                        
            try? await permissionGranted.send(
                location.requestPermission(.always) == .authorizedAlways
            )
            
            for await event in await location.startMonitoringAuthorization() {
                NSLog("GOT EVENT")
                permissionGranted.send(event.authorizationStatus == .authorizedAlways)
            }
        }
    }
}
