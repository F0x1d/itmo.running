//
//  PermissionViewModelTests.swift
//
//
//  Created by Maksim Zoteev on 09.03.2024.
//

import Foundation
import XCTest
import CoreDI
import CoreTesting
@testable import FeatureWelcome

final class PermissionViewModelTests: XCTestCase {
    override func setUp() async throws {
        di.reset()
    }
    
    func testShouldRequestPermissionTest() async {
        var requestedPermission = false
        withLocationManager(whenInUse: {
            requestedPermission = true
            return .authorizedWhenInUse
        })
        
        let viewModel = await di.permissionViewModel()
        
        let task = await viewModel.requestPermission()
        await task.value
        
        XCTAssertTrue(requestedPermission, "should request permission")
    }
}
