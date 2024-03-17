//
//  NavigatorModule.swift
//
//
//  Created by Maksim Zoteev on 09.03.2024.
//

import Foundation
import Factory

extension Container {
    var navigator: Factory<WelcomeNavigator> {
        self { WelcomeNavigator() }.shared
    }
}
