//
//  WelcomedRule.swift
//
//
//  Created by Maksim Zoteev on 10.03.2024.
//

import Foundation
import CoreDI
import FeatureWelcome

public let TEST_RULE_NOT_WELCOMED = "rule_not_welcomed"
public let TEST_RULE_WELCOMED = "rule_welcomed"

struct WelcomedRule: TestingRule {
    func setup() {
        di.welcomeStore.onArg(TEST_RULE_NOT_WELCOMED) { WelcomeStoreMock(false) }
        di.welcomeStore.onArg(TEST_RULE_WELCOMED) { WelcomeStoreMock(true) }
    }
}
