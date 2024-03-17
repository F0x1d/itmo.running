//
//  StoresModule.swift
//
//
//  Created by Maksim Zoteev on 09.03.2024.
//

import Foundation
import Factory

public extension Container {
    var welcomeStore: Factory<WelcomeStore> {
        self { WelcomeStore() }.singleton
    }
}
