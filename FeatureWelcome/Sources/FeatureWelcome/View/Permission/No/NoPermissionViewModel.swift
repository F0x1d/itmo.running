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
        
    @Injected(\.navigator) private var navigator
    
    func openSettings() {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
    }
    
    func checkPermission() -> Task<Void, Never> {
        Task {
            let result = try? await di.location().requestPermission(.always)
            
            if case .authorizedAlways = result {
                navigator.openReadyScreen()
            }
        }
    }
}
