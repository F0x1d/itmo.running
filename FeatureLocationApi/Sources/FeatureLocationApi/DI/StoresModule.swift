//
//  File.swift
//  
//
//  Created by Maksim Zoteev on 11.05.2024.
//

import Foundation
import Factory

public extension Container {
    var locationPermissionStore: Factory<LocationPermissionStore> {
        self { LocationPermissionStore() }.singleton
    }
}
