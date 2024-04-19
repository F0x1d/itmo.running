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
    
    public var distance: Double
    public var startTime: Date
    public var endTime: Date
    
    public var coordinates: [CLLocationCoordinate2D]
    
    public init(distance: Double, startTime: Date, endTime: Date, coordinates: [CLLocationCoordinate2D]) {
        self.distance = distance
        self.startTime = startTime
        self.endTime = endTime
        
        self.coordinates = coordinates
    }
}

extension CLLocationCoordinate2D: Encodable, Decodable {
    
    public init(from decoder: any Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        
        self.init(
            latitude: try c.decode(Double.self, forKey: .latitude),
            longitude: try c.decode(Double.self, forKey: .longitude)
        )
    }
    
    public func encode(to encoder: any Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)
        
        try c.encode(self.latitude, forKey: .latitude)
        try c.encode(self.longitude, forKey: .longitude)
    }
    
    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
    }
}
