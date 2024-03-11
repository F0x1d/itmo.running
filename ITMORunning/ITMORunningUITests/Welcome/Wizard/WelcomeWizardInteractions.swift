//
//  WelcomeWizardInteractions.swift
//  ITMORunningUITests
//
//  Created by Maksim Zoteev on 10.03.2024.
//

import Foundation
import XCTest
@testable import FeatureWelcome

struct WelcomeWizardInteractions {
    private let application = XCUIApplication()
    
    var helloButton: XCUIElement {
        application.buttons[WelcomeView.HELLO_BUTTON_TEST_TAG]
    }
    
    var grantPermissionButton: XCUIElement {
        application.buttons[PermissionView.GRANT_BUTTON_TEST_TAG]
    }
    
    var grantAlwaysPermissionButton: XCUIElement {
        application.buttons[AlwaysPermissionView.GRANT_ALWAYS_BUTTON_TEST_TAG]
    }
    
    var openSettingsButton: XCUIElement {
        application.buttons[NoPermissionView.OPEN_SETTINGS_BUTTON_TEST_TAG]
    }
    
    var excellentText: XCUIElement {
        application.staticTexts[ReadyView.EXCELLENT_TEXT_TEST_TAG]
    }
}
