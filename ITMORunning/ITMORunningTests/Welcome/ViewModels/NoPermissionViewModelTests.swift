//
//  NoPermissionViewModelTests.swift
//  
//
//  Created by Maksim Zoteev on 10.03.2024.
//

import Foundation
import XCTest
import CoreTesting
import CoreDI
@testable import FeatureWelcome

final class NoPermissionViewModelTests: XCTestCase {
    override func setUp() async throws {
        di.reset()
    }
    
    func testShouldTryUpdatePermissionStatus() async {
        var requestedPermission = false
        withLocationManager(always: {
            requestedPermission = true
            return .authorizedAlways
        })
        
        let viewModel = await di.noPermissionViewModel()
        
        let task = await viewModel.checkPermission()
        await task.value
        
        XCTAssertTrue(requestedPermission, "should request always permission")
    }
}
