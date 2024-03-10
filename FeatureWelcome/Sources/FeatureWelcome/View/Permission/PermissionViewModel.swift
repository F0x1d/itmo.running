//
//  PermissionViewModel.swift
//
//
//  Created by Maksim Zoteev on 09.03.2024.
//

import Foundation
import CoreArch
import CoreDI
import SwiftLocation
import AlertKit
import Factory

final class PermissionViewModel: BaseViewModel {
    
    @Injected(\.location) private var location
    @Injected(\.navigator) private var navigator
        
    func requestPermission() -> Task<Void, Never> {
        Task {
            do {
                let result = try await location.requestPermission(.whenInUse)
                
                switch result {
                case .authorizedAlways, .authorizedWhenInUse:
                    navigator.openAlwaysPermissionScreen()
                    
                default:
                    navigator.openNoPermissionScreen(waitFor: .whenInUse)
                }
            } catch {
                navigator.openNoPermissionScreen(waitFor: .whenInUse)
            }
        }
    }
}
