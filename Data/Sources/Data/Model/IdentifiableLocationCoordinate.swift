//
//  IdentifiableLocationCoordinate.swift
//
//
//  Created by Maksim Zoteev on 11.05.2024.
//

import Foundation
import CoreLocation

public struct IdentifiableLocationCoordinate: Identifiable {
    public let id: Int
    public let wrapped: CLLocationCoordinate2D
    
    public init(id: Int, wrapped: CLLocationCoordinate2D) {
        self.id = id
        self.wrapped = wrapped
    }
}

extension IdentifiableLocationCoordinate: Decodable, Encodable {
    
    public init(from decoder: any Decoder) throws {
        let c = try decoder.container(keyedBy: CondingKeys.self)
        
        self.init(
            id: try c.decode(Int.self, forKey: .id),
            wrapped: try c.decode(CLLocationCoordinate2D.self, forKey: .coordinate)
        )
    }
    
    public func encode(to encoder: any Encoder) throws {
        var c = encoder.container(keyedBy: CondingKeys.self)
        
        try c.encode(self.id, forKey: .id)
        try c.encode(self.wrapped, forKey: .coordinate)
    }
    
    enum CondingKeys: String, CodingKey {
        case id
        case coordinate
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
