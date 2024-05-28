//
//  Training.swift
//
//
//  Created by Maksim Zoteev on 18.04.2024.
//

import Foundation
import SwiftData
import CoreLocation

@Model
public class Training {
    
    public var distance: Double = 0
    public var startTime: Date = Date()
    public var endTime: Date = Date()
    
    public var coordinates: [IdentifiableLocationCoordinate] = []
    
    public init(
        distance: Double,
        startTime: Date,
        endTime: Date,
        coordinates: [IdentifiableLocationCoordinate]
    ) {
        self.distance = distance
        self.startTime = startTime
        self.endTime = endTime
        
        self.coordinates = coordinates
    }
}
