//
//  LocationModule.swift
//
//
//  Created by Maksim Zoteev on 09.03.2024.
//

import Foundation
import CoreLocation
import SwiftLocation
import Factory

public extension Container {
    var locationManager: Factory<CLLocationManager> {
        self { CLLocationManager() }
    }
    
    var location: Factory<Location> {
        self {
            Location(
                locationManager: self.locationManager(),
                allowsBackgroundLocationUpdates: true
            )
        }
    }
}
