//
//  LocationPermissionRepository.swift
//  ITMORunning
//
//  Created by Maksim Zoteev on 19.04.2024.
//

import Foundation
import Combine
import CoreArch
import CoreLocation
import CoreDI
import SwiftLocation

final class LocationPermissionRepository: BaseRepository {
    
    private let locationPermissionGranted = CurrentValueSubject<Bool, Never>(_isLocationPermissionAvailable())
    
    func permissionGrantedPublisher() -> AnyPublisher<Bool, Never> {
        locationPermissionGranted
            .removeDuplicates()
            .eraseToAnyPublisher()
    }
    
    func isLocationPermissionAvailable() -> Bool {
        let granted = _isLocationPermissionAvailable()
        locationPermissionGranted.send(granted)
        
        return granted
    }
}

fileprivate func _isLocationPermissionAvailable() -> Bool {
    di.locationManager().authorizationStatus == .authorizedAlways
}
