//
//  ColorSchemeExtensions.swift
//
//
//  Created by Maksim Zoteev on 18.04.2024.
//

import Foundation
import SwiftUI

public extension ColorScheme {
    var isLightTheme: Bool {
        self == .light
    }
    
    var colorPrimary: Color {
        isLightTheme ? .black : .white
    }
    
    var colorOnPrimary: Color {
        isLightTheme ? .white : .black
    }
}
