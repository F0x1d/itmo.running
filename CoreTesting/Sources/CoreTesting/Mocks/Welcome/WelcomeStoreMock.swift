//
//  WelcomeStoreMock.swift
//
//
//  Created by Maksim Zoteev on 10.03.2024.
//

import Foundation
import FeatureWelcome

class WelcomeStoreMock: WelcomeStore {
    
    private var _welcomed = false
    
    init(_ welcomed: Bool) {
        self._welcomed = welcomed
    }
    
    override var welcomed: Bool {
        get {
            _welcomed
        }
        set {}
    }
}
