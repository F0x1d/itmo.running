//
//  Annotations.swift
//
//
//  Created by Maksim Zoteev on 19.04.2024.
//

import Foundation
import CoreLocation
import SwiftUI
import MapKit

public struct MeAnnotation: MapContent {
    let coordinate: CLLocationCoordinate2D
    
    public init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
    
    public var body: some MapContent {
        Annotation("me", coordinate: coordinate) {
            Circle()
                .fill(.blue)
                .strokeBorder(.white, lineWidth: 3)
                .frame(width: 20, height: 20)
        }
        .annotationTitles(.hidden)
    }
}

public struct PathAnnotation: MapContent {
    let coordinate: CLLocationCoordinate2D
    
    public init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
    
    public var body: some MapContent {
        Annotation("<hidden>", coordinate: coordinate) {
            Circle()
                .fill(.red)
                .frame(width: 5, height: 5)
        }
        .annotationTitles(.hidden)
    }
}
