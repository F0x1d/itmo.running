//
//  DoubleExtensions.swift
//
//
//  Created by Maksim Zoteev on 11.05.2024.
//

import Foundation

public extension Double {
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
