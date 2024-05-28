//
//  IdentifiableLocation.swift
//
//
//  Created by Maksim Zoteev on 19.04.2024.
//

import Foundation
import CoreLocation

public struct IdentifiableLocation: Identifiable {
    public let id: Int
    public let wrapped: CLLocation
    
    public init(id: Int, location: CLLocation) {
        self.id = id
        self.wrapped = location
    }
}
