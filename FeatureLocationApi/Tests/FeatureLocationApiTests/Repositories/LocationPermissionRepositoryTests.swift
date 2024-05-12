//
//  LocationPermissionRepositoryTests.swift
//
//
//  Created by Maksim Zoteev on 12.05.2024.
//

import Foundation
import CoreDI
import CoreTesting
import XCTest
@testable import FeatureLocationApi

final class LocationPermissionRepositoryTests: BaseXCTestCase {
    
    func testShouldGetCurrentDeniedPermissionStatus() {
        withLocationManager(
            authorizationStatus: .denied
        )
        
        let _ = di.locationPermissionRepository()
            .observePermissionStatus()
            .prefix(1)
            .sink { XCTAssertFalse($0, "permission is denied initially") }
            .store(in: &compositeSubscription)
    }
    
    func testShouldGetCurrentGrantedPermissionStatus() {
        withLocationManager(
            authorizationStatus: .authorizedAlways
        )
        
        di.locationPermissionRepository()
            .observePermissionStatus()
            .prefix(1)
            .sink { XCTAssertTrue($0, "permission is granted initially") }
            .store(in: &compositeSubscription)
    }
}
