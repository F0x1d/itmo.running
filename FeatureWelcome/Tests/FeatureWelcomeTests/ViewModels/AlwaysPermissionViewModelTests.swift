//
//  AlwaysPermissionViewModelTests.swift
//
//
//  Created by Maksim Zoteev on 10.03.2024.
//

import Foundation
import XCTest
import CoreDI
import CoreTesting
@testable import FeatureWelcome

final class AlwaysPermissionViewModelTests: BaseXCTestCase {
    
    func testShouldRequestPermission() async {
        var requestedPermission = false
        withLocationManager(
            always: {
                requestedPermission = true
                return .authorizedAlways
            }
        )
        
        let viewModel = await di.alwaysPermissionViewModel()
        
        let task = await viewModel.requestAlwaysPermission()
        await task.value
        
        XCTAssertTrue(requestedPermission, "should request always permission")
    }
}
