//
//  WelcomeWizardRobot.swift
//  ITMORunningUITests
//
//  Created by Maksim Zoteev on 10.03.2024.
//

import Foundation
import XCTest

struct WelcomeWizardRobot {
    private let interactions = WelcomeWizardInteractions()
    
    func tapHello() -> WelcomeWizardRobot {
        interactions.helloButton.tap()
        return self
    }
    
    func tapGrantPermission() -> WelcomeWizardRobot {
        interactions.grantPermissionButton.tap()
        return self
    }
    
    func tapAlwaysGrantPermission() -> WelcomeWizardRobot {
        interactions.grantAlwaysPermissionButton.tap()
        return self
    }
    
    func checkOnNoPermissionScreen() -> WelcomeWizardRobot {
        XCTAssertTrue(interactions.openSettingsButton.waitForExistence(timeout: 3), "should see no permission screen")
        return self
    }
    
    func checkOnReadyScreen() -> WelcomeWizardRobot {
        XCTAssertTrue(interactions.excellentText.waitForExistence(timeout: 3), "excellent text should be shown on ready screen")
        return self
    }
}
