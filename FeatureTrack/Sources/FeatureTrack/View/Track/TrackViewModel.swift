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
    @Injected(\.modelContext) private var modelContext
    
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
            
            if path.isEmpty { return }
            
            let training: Training? = await Task { @TrackViewModelActor [weak self] in
                guard let self else { return nil }
                
                var distance: Double = 0
                var prevPoint: CLLocation? = nil
                for location in await path {
                    guard var prevPoint else {
                        prevPoint = location.wrapped
                        continue
                    }
                    
                    let nextPoint = location.wrapped
                    
                    distance += prevPoint.distance(from: nextPoint)
                    prevPoint = nextPoint
                }
                
                return await Training(
                    distance: distance,
                    startTime: path.first!.wrapped.timestamp,
                    endTime: path.last!.wrapped.timestamp,
                    coordinates: path.map { $0.wrapped.coordinate }
                )
            }.value
            
            if let training {
                modelContext.insert(training)
            }
            
            withAnimation { [weak self] in
                guard let self else { return }
                
                monitoring = false
                path = []
            }
        }
    }
    
    func stopMonitoring() {
        monitoringTask?.cancel()
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

@globalActor actor TrackViewModelActor {
    static let shared = TrackViewModelActor()
}
