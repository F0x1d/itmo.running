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
    
    public var length: Float
    public var startTime: Int64
    public var endTime: Int64
    
    public var coordinates: [CLLocationCoordinate2D]
    public var distance: Double
    
    init(length: Float, startTime: Int64, endTime: Int64, coordinates: [CLLocationCoordinate2D], distance: Double) {
        self.length = length
        self.startTime = startTime
        self.endTime = endTime
        
        self.coordinates = coordinates
        self.distance = distance
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
