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
    
    @Published public var path = NavigationPath()
    
    public init() { }
    
    public func popBackStack() {
        path.removeLast()
    }
    
    public func openScreen(_ screen: Screen) {
        path.append(screen)
    }
}
