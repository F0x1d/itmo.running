//
//  ApplicationExtensions.swift
//  ITMORunningUITests
//
//  Created by Maksim Zoteev on 10.03.2024.
//

import Foundation
import XCTest

extension XCUIApplication {
    static func launchWithRules(_ rules: String...) {
        let app = XCUIApplication()
        app.launchArguments += rules
        app.launch()
    }
}
