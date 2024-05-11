//
//  NavigationModule.swift
//
//
//  Created by Maksim Zoteev on 11.05.2024.
//

import Foundation
import Factory

extension Container {
    var navigator: Factory<HistoryNavigator> {
        self { HistoryNavigator() }.singleton
    }
}
