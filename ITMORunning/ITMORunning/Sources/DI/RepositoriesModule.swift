//
//  RepositoriesModule.swift
//  ITMORunning
//
//  Created by Maksim Zoteev on 19.04.2024.
//

import Foundation
import Factory

extension Container {
    var locationPermissionRepository: Factory<LocationPermissionRepository> {
        self { LocationPermissionRepository() }.singleton
    }
}
