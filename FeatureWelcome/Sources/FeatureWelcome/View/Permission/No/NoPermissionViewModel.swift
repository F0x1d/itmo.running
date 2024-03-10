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
import Factory

final class NoPermissionViewModel: BaseViewModel {
    
    private let waitingFor: LocationPermission
    
    @Injected(\.location) private var location
    @Injected(\.navigator) private var navigator
    
    init(waitingFor: LocationPermission) {
        self.waitingFor = waitingFor
    }
    
    func openSettings() {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
    }
    
    func checkPermission() -> Task<Void, Never> {
        Task {
            let result = try? await location.requestPermission(waitingFor)
            
            if case .authorizedAlways = result {
                navigator.openReadyScreen()
            } else if case .authorizedWhenInUse = result, case .whenInUse = waitingFor {
                navigator.openAlwaysPermissionScreen()
            }
        }
    }
}
