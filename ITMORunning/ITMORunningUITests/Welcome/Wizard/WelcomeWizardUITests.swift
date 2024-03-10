//
//  WelcomeWizardUITests.swift
//  ITMORunningUITests
//
//  Created by Maksim Zoteev on 10.03.2024.
//

import Foundation
import XCTest
import CoreDI
import CoreTesting
@testable import ITMORunning

final class WelcomeWizardUITests: XCTestCase {
    func testSuccessfulSetup() {
        XCUIApplication.launchWithRules(
            TEST_RULE_NOT_WELCOMED,
            TEST_RULE_LOCATION_ALL
        )
        
        let _ = WelcomeWizardRobot()
            .tapHello()
            .tapGrantPermission()
            .tapAlwaysGrantPermission()
            .checkOnReadyScreen()
    }
    
    func testPartlySuccessfulSetup() {
        XCUIApplication.launchWithRules(
            TEST_RULE_NOT_WELCOMED,
            TEST_RULE_LOCATION_WHEN_IN_USE
        )
        
        let _ = WelcomeWizardRobot()
            .tapHello()
            .tapGrantPermission()
            .tapAlwaysGrantPermission()
            .checkOnNoPermissionScreen()
    }
    
    func testUnsuccessfulSetup() {
        XCUIApplication.launchWithRules(
            TEST_RULE_NOT_WELCOMED,
            TEST_RULE_LOCATION_NO
        )
        
        let _ = WelcomeWizardRobot()
            .tapHello()
            .tapGrantPermission()
            .checkOnNoPermissionScreen()
    }
}
