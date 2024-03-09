//
//  BaseNavigator.swift
//
//
//  Created by Maksim Zoteev on 08.03.2024.
//

import Foundation
import SwiftUI

open class BaseNavigator<Screen: Hashable>: ObservableObject {
    public let screenType = Screen.self
    
    public var path = NavigationPath()
    
    public init() { }
    
    public func popBackStack() {
        path.removeLast()
    }
    
    internal func openScreen(_ screen: Screen) {
        path.append(screen)
    }
}
