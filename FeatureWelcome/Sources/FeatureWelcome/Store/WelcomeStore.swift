//
//  WelcomeStore.swift
//
//
//  Created by Maksim Zoteev on 09.03.2024.
//

import Foundation
import SwiftUI

open class WelcomeStore: ObservableObject {
    @AppStorage("welcomed")
    open var welcomed = false
    
    public init() { }
}
