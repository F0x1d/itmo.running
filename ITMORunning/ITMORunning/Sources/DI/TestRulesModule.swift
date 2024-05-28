//
//  TestRulesModule.swift
//  ITMORunning
//
//  Created by Maksim Zoteev on 12.05.2024.
//

import Foundation
import CoreTesting
import FeatureWelcome
import Factory

fileprivate let rules: [TestingRule.Type] = [
    LocationManagerRule.self,
    WelcomedRule.self
]

extension Container: AutoRegistering {
    public func autoRegister() {
        for rule in rules {
            rule.setup()
        }
    }
}
