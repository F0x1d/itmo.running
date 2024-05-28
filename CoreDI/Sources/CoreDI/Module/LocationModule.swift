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
    var locationManager: Factory<any LocationManagerProtocol> {
        self {
            let manager = CLLocationManager()
            manager.showsBackgroundLocationIndicator = true
            return manager
        }
    }
    
    var location: Factory<Location> {
        self {
            let location = Location(
                locationManager: self.locationManager(),
                allowsBackgroundLocationUpdates: true
            )
            location.accuracy = LocationAccuracy.bestForNavigation
            location.activityType = CLActivityType.fitness
            return location
        }
    }
}
