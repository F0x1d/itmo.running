//
//  TrackViewModel.swift
//
//
//  Created by Maksim Zoteev on 19.04.2024.
//

import Foundation
import Data
import CoreArch
import CoreDI
import SwiftUI
import MapKit
import Factory
import CoreLocation
import SwiftLocation

final class TrackViewModel: BaseViewModel {
    @Published var currentLocation: CLLocationCoordinate2D? = nil
    @Published var currentMapCameraPosition = MapCameraPosition.automatic
    
    @Published var items = [CLLocationCoordinate2D]()
    
    @Injected(\.location) private var location
    
    override init() {
        super.init()
        
        Task { [weak self] in
            guard let self else { return }
            
            for await event in try await location.startMonitoringLocations() {
                switch event {
                case .didPaused:
                    continue
                case .didResume:
                    continue
                case let .didUpdateLocations(locations):
                    guard let lastLocation = locations.last else { continue }
                    
                    NSLog("GOT LOCATION \(lastLocation)")
                    
                    items.append(contentsOf: locations.map { $0.coordinate })
                    
                    currentLocation = lastLocation.coordinate
                    currentMapCameraPosition = MapCameraPosition.region(
                        MKCoordinateRegion(
                            center: lastLocation.coordinate,
                            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                        )
                    )
                    
                case .didFailed(_):
                    continue
                }
            }
        }
    }
}
