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
    
    @Published var currentMapCameraPosition = MapCameraPosition.userLocation(
        followsHeading: true,
        fallback: .automatic
    )
    
    @Published var monitoring = false
    @Published var path = [IdentifiableLocation]()
    
    @Published var distance: Double = 0
    @Published var speed: Double = 0
    @Published var midSpeed: Double = 0
    @Published var startTime = Date()
    
    @Injected(\.location) private var location
    @Injected(\.modelContext) private var modelContext
    
    private var monitoringTask: Task<Void, Error>? = nil
    
    func startMonitoring() {
        withAnimation {
            distance = 0
            speed = 0
            midSpeed = 0
            startTime = Date()
            monitoring = true
        }
        
        // falling back to user's location
        currentMapCameraPosition = .userLocation(
            followsHeading: true,
            fallback: .automatic
        )
        
        var currentLocationId = 0
        
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
                    let now = Date()
                    let previousLocation = path.last?.wrapped
                    let previousLocationAsList = previousLocation == nil ? [] : [previousLocation!]
                    
                    let processedLocations: [IdentifiableLocation] = locations.compactMap { location in
                        if now.timeIntervalSince(location.timestamp) >= 60 { return nil }
                        if let previousLocation, location.distance(from: previousLocation) <= 6 { return nil }
                        
                        currentLocationId += 1
                        return IdentifiableLocation(
                            id: currentLocationId,
                            location: location
                        )
                    }
                    
                    withAnimation { [weak self] in
                        guard let self else { return }
                        
                        distance += calculateDistanceFor(locations: previousLocationAsList + processedLocations.map { $0.wrapped })
                        if let newSpeed = locations.last?.speed {
                            speed = newSpeed >= 0 ? newSpeed : 0
                        }
                        midSpeed = distance / now.timeIntervalSince(startTime)
                    }
                    path.append(contentsOf: processedLocations)
                    
                case .didFailed(_):
                    continue
                }
            }
            
            location.stopUpdatingLocation()
            
            if path.count > 1 {
                let training: Training? = await Task { @TrackViewModelActor [weak self] in
                    guard let self else { return nil }
                    
                    return await Training(
                        distance: distance,
                        startTime: await startTime,
                        endTime: Date(),
                        coordinates: path.map { location in
                            IdentifiableLocationCoordinate(
                                id: location.id,
                                wrapped: location.wrapped.coordinate
                            )
                        }
                    )
                }.value
                
                if let training {
                    modelContext.insert(training)
                }
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
        monitoringTask = nil
    }
    
    private func calculateDistanceFor(locations: [CLLocation]) -> Double {
        var distance: Double = 0
        var prevPoint: CLLocation? = nil
        
        for location in locations {
            guard var prevPoint else {
                prevPoint = location
                continue
            }
            
            let nextPoint = location
            
            distance += prevPoint.distance(from: nextPoint)
            prevPoint = nextPoint
        }
        
        return distance
    }
}

@globalActor actor TrackViewModelActor {
    static let shared = TrackViewModelActor()
}
