//
//  ViewModelsModule.swift
//
//
//  Created by Maksim Zoteev on 09.03.2024.
//

import Foundation
import SwiftLocation
import Factory

@MainActor extension Container {
    var permissionViewModel: Factory<PermissionViewModel> {
        self { PermissionViewModel() }
    }
    
    var alwaysPermissionViewModel: Factory<AlwaysPermissionViewModel> {
        self { AlwaysPermissionViewModel() }
    }
    
    var noPermissionViewModel: ParameterFactory<LocationPermission, NoPermissionViewModel> {
        self { NoPermissionViewModel(waitingFor: $0) }
    }
    
    var readyViewModel: Factory<ReadyViewModel> {
        self { ReadyViewModel() }
    }
}
