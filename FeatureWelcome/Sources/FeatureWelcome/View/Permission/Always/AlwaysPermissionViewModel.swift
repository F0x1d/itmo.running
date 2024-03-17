//
//  AlwaysPermissionViewModel.swift
//
//
//  Created by Maksim Zoteev on 10.03.2024.
//

import Foundation
import CoreArch
import Factory

final class AlwaysPermissionViewModel: BaseViewModel {
    
    @Injected(\.location) private var location
    @Injected(\.navigator) private var navigator
    
    func requestAlwaysPermission() -> Task<Void, Never> {
        Task {
            do {
                let result = try await location.requestPermission(.always)
                
                if case .authorizedAlways = result {
                    navigator.openReadyScreen()
                } else {
                    navigator.openNoPermissionScreen(waitFor: .always)
                }
            } catch {
                navigator.openNoPermissionScreen(waitFor: .always)
            }
        }
    }
}
