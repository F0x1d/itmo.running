//
//  WelcomeStoreMock.swift
//
//
//  Created by Maksim Zoteev on 12.05.2024.
//

import Foundation
import CoreTesting
import CoreDI
import Factory

public let TEST_RULE_NOT_WELCOMED = "rule_not_welcomed"
public let TEST_RULE_WELCOMED = "rule_welcomed"

public struct WelcomedRule: TestingRule {
    public static func setup() {
        di.welcomeStore.onArg(TEST_RULE_NOT_WELCOMED) { WelcomeStoreMock(false) }
        di.welcomeStore.onArg(TEST_RULE_WELCOMED) { WelcomeStoreMock(true) }
    }
}

fileprivate class WelcomeStoreMock: WelcomeStore {
    
    private var _welcomed = false
    
    init(_ welcomed: Bool) {
        self._welcomed = welcomed
    }
    
    override var welcomed: Bool {
        get { _welcomed }
        set { }
    }
}
