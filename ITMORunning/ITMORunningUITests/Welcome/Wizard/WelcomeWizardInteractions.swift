//
//  WelcomeWizardInteractions.swift
//  ITMORunningUITests
//
//  Created by Maksim Zoteev on 10.03.2024.
//

import Foundation
import XCTest

struct WelcomeWizardInteractions {
    private let application = XCUIApplication()
    
    var helloButton: XCUIElement {
        application.buttons["hello_button"]
    }
    
    var grantPermissionButton: XCUIElement {
        application.buttons["grant_button"]
    }
    
    var grantAlwaysPermissionButton: XCUIElement {
        application.buttons["grant_always_button"]
    }
    
    var openSettingsButton: XCUIElement {
        application.buttons["open_settings_button"]
    }
    
    var excellentText: XCUIElement {
        application.staticTexts["excellent_text"]
    }
}
