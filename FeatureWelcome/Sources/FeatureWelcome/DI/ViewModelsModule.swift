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
    
    var noPermissionViewModel: Factory<NoPermissionViewModel> {
        self { NoPermissionViewModel() }
    }
    
    var readyViewModel: Factory<ReadyViewModel> {
        self { ReadyViewModel() }
    }
}
