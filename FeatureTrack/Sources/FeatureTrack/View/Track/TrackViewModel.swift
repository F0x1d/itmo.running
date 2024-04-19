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
    @Published var currentLocation: CLLocation? = nil
    @Published var currentMapCameraPosition = MapCameraPosition.automatic
    
    @Published var monitoring = false
    @Published var path = [IdentifiableLocation]()
    
    @Injected(\.location) private var location
    
    private var monitoringTask: Task<Void, Error>? = nil
    
    override init() {
        super.init()
        
        Task {
            // Initial
            while !Task.isCancelled {
                do {
                    updateLocation(with: try await location.requestLocation().location)
                    break
                } catch {
                    try? await Task.sleep(for: .seconds(1))
                }
            }
        }
    }
    
    func startMonitoring() {
        withAnimation {
            monitoring = true
        }
        
        var currentId = 0
        
        if let currentLocation {
            path.append(
                IdentifiableLocation(id: currentId, location: currentLocation)
            )
        }
                
        monitoringTask = Task { [weak self] in
            guard let self else { return }
                        
            for await event in try await location.startMonitoringLocations() {
                if Task.isCancelled { break }
                
                switch event {
                case .didPaused:
                    continue
                case .didResume:
                    continue
                case let .didUpdateLocations(locations):
                    guard let lastLocation = locations.last else { continue }
                    
                    path.append(
                        contentsOf: locations.map { location in
                            currentId += 1
                            return IdentifiableLocation(id: currentId, location: location)
                        }
                    )
                    
                    updateLocation(with: lastLocation)

                case .didFailed(_):
                    continue
                }
            }
            
            location.stopUpdatingLocation()            
        }
    }
    
    func stopMonitoring() {
        monitoringTask?.cancel()
        
        withAnimation {
            monitoring = false
            path = []
        }
    }
    
    private func updateLocation(with location: CLLocation?) {
        currentLocation = location
        
        withAnimation {
            if let location {
                currentMapCameraPosition = MapCameraPosition.region(
                    MKCoordinateRegion(
                        center: location.coordinate,
                        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                    )
                )
            } else {
                currentMapCameraPosition = MapCameraPosition.automatic
            }
        }
    }
}
