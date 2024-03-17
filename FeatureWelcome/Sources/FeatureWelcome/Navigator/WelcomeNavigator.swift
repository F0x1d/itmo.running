//
//  WelcomeNavigator.swift
//
//
//  Created by Maksim Zoteev on 08.03.2024.
//

import Foundation
import CoreNavigation
import SwiftLocation

final class WelcomeNavigator: BaseNavigator<WelcomeScreen> {
    
    func openPermissionScreen() {
        openScreen(.permission)
    }
    
    func openAlwaysPermissionScreen() {
        openScreen(.alwaysPermission)
    }
    
    func openNoPermissionScreen(waitFor: LocationPermission) {
        openScreen(.noPermission(waitFor: waitFor))
    }
    
    func openReadyScreen() {
        openScreen(.ready)
    }
}

enum WelcomeScreen: Hashable {
    case permission
    case alwaysPermission
    case noPermission(waitFor: LocationPermission)
    case ready
}
