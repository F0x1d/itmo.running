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
    
    @Published var monitoring = false
    @Published var items = [CLLocationCoordinate2D]()
    
    @Injected(\.location) private var location
    
    private var monitoringTask: Task<Void, Error>? = nil
    
    override init() {
        super.init()
        
        Task {
            // Initial
            while !Task.isCancelled {
                do {
                    updateLocation(with: try await location.requestLocation().location?.coordinate)
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
        
        monitoringTask = Task { [weak self] in
            guard let self else { return }
            
            for await event in try await location.startMonitoringLocations() {
                switch event {
                case .didPaused:
                    continue
                case .didResume:
                    continue
                case let .didUpdateLocations(locations):
                    guard let lastLocation = locations.last else { continue }
                                        
                    withAnimation { [weak self] in
                        guard let self else { return }
                        
                        items.append(contentsOf: locations.map { $0.coordinate })
                        
                        currentLocation = lastLocation.coordinate
                        currentMapCameraPosition = MapCameraPosition.region(
                            MKCoordinateRegion(
                                center: lastLocation.coordinate,
                                span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                            )
                        )
                    }

                case .didFailed(_):
                    continue
                }
            }
        }
    }
    
    func stopMonitoring() {
        monitoringTask?.cancel()
        
        withAnimation {
            monitoring = false
            items = []
        }
    }
    
    private func updateLocation(with location: CLLocationCoordinate2D?) {
        currentLocation = location
        
        if let location {
            currentMapCameraPosition = MapCameraPosition.region(
                MKCoordinateRegion(
                    center: location,
                    span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                )
            )
        } else {
            currentMapCameraPosition = MapCameraPosition.automatic
        }
    }
}
