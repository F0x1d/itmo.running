//
//  WelcomeStore.swift
//
//
//  Created by Maksim Zoteev on 09.03.2024.
//

import Foundation
import SwiftUI

public class WelcomeStore: ObservableObject {
    
    @AppStorage("welcomed")
    public var welcomed = false
    
    public init() { }
}
