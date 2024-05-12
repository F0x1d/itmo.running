//
//  File.swift
//  
//
//  Created by Maksim Zoteev on 10.03.2024.
//

import Foundation
import CoreDI
import CoreLocation
import Factory

public let TEST_RULE_LOCATION_ALL = "rule_location_all"
public let TEST_RULE_LOCATION_WHEN_IN_USE = "rule_location_when_in_use"
public let TEST_RULE_LOCATION_NO = "rule_location_no"

public struct LocationManagerRule: TestingRule {
    public static func setup() {
        di.locationManager.onPreview {
            LocationManagerMock()
        }
        
        di.locationManager.onArg(TEST_RULE_LOCATION_ALL) {
            let mock = LocationManagerMock()
            mock.onRequestWhenInUseAuthorization = { .authorizedWhenInUse }
            mock.onRequestAlwaysAuthorization = { .authorizedAlways }
            
            return mock
        }
        di.locationManager.onArg(TEST_RULE_LOCATION_WHEN_IN_USE) {
            let mock = LocationManagerMock()
            mock.onRequestWhenInUseAuthorization = { .authorizedWhenInUse }
            mock.onRequestAlwaysAuthorization = { .denied }
            
            return mock
        }
        di.locationManager.onArg(TEST_RULE_LOCATION_NO) {
            let mock = LocationManagerMock()
            mock.onRequestWhenInUseAuthorization = { .denied }
            mock.onRequestAlwaysAuthorization = { .denied }
            
            return mock
        }
    }
}

public func withLocationManager(
    whenInUse: @escaping () -> CLAuthorizationStatus = { .authorizedWhenInUse },
    always: @escaping () -> CLAuthorizationStatus = { .authorizedAlways },
    authorizationStatus: CLAuthorizationStatus = .notDetermined
) {
    di.locationManager.register {
        let mock = LocationManagerMock()
        mock.onRequestWhenInUseAuthorization = whenInUse
        mock.onRequestAlwaysAuthorization = always
        mock.authorizationStatus = authorizationStatus
        
        return mock
    }
}
