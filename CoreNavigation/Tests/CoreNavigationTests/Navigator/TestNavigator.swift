//
//  TestNavigator.swift
//  
//
//  Created by Maksim Zoteev on 08.03.2024.
//

import Foundation
@testable import CoreNavigation

final class TestNavigator: BaseNavigator<TestScreen> {
    func openFirstScreen() {
        openScreen(.first)
    }
    
    func openSecondScreen() {
        openScreen(.second)
    }
}

enum TestScreen: Hashable {
    case first, second
}
