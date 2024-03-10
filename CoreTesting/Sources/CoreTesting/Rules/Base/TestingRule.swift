//
//  TestingRule.swift
//
//
//  Created by Maksim Zoteev on 10.03.2024.
//

import Foundation
import Factory

protocol TestingRule {
    func setup()
}

fileprivate let rules: [any TestingRule] = [
    LocationManagerRule(),
    WelcomedRule()
]

extension Container: AutoRegistering {
    public func autoRegister() {
        for rule in rules {
            rule.setup()
        }
    }
}
