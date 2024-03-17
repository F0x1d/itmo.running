//
//  LocationManagerMock.swift
//
//
//  Created by Maksim Zoteev on 09.03.2024.
//

import Foundation
import CoreLocation
import SwiftLocation

public class LocationManagerMock: LocationManagerProtocol {
    
    let fakeInstance = CLLocationManager()
    public weak var delegate: CLLocationManagerDelegate?

    public var allowsBackgroundLocationUpdates: Bool = false
    
    public var isLocationServicesEnabled: Bool = true {
        didSet {
            guard isLocationServicesEnabled != oldValue else { return }
            delegate?.locationManagerDidChangeAuthorization?(fakeInstance)
        }
    }
    public var authorizationStatus: CLAuthorizationStatus = .notDetermined {
        didSet {
            guard authorizationStatus != oldValue else { return }
            delegate?.locationManagerDidChangeAuthorization?(fakeInstance)
        }
    }
    
    public var accuracyAuthorization: CLAccuracyAuthorization = .reducedAccuracy {
        didSet {
            guard accuracyAuthorization != oldValue else { return }
            delegate?.locationManagerDidChangeAuthorization?(fakeInstance)
        }
    }

    public var desiredAccuracy: CLLocationAccuracy = 100.0
    public var activityType: CLActivityType = .other
    public var distanceFilter: CLLocationDistance = kCLDistanceFilterNone
    
    public var onValidatePlistConfiguration: ((_ permission: LocationPermission) -> Error?) = { _ in
        return nil
    }
    
    public var onRequestWhenInUseAuthorization: (() -> CLAuthorizationStatus) = { .authorizedWhenInUse }
    public var onRequestAlwaysAuthorization: (() -> CLAuthorizationStatus) = { .authorizedAlways }
    public var onRequestValidationForTemporaryAccuracy: ((String) -> Error?) = { _ in return nil }


    public func updateLocations(event: Tasks.ContinuousUpdateLocation.StreamEvent) {
        switch event {
        case let .didUpdateLocations(locations):
            delegate?.locationManager?(fakeInstance, didUpdateLocations: locations)
        #if os(iOS)
        case .didResume:
            delegate?.locationManagerDidResumeLocationUpdates?(fakeInstance)
        case .didPaused:
            delegate?.locationManagerDidPauseLocationUpdates?(fakeInstance)
        #endif
        case let .didFailed(error):
            delegate?.locationManager?(fakeInstance, didFailWithError: error)
        }
    }

    #if !os(watchOS) && !os(tvOS)
    public func updateSignificantLocation(event: Tasks.SignificantLocationMonitoring.StreamEvent) {
        switch event {
        case let .didFailWithError(error):
            delegate?.locationManager?(fakeInstance, didFailWithError: error)
        case .didPaused:
            delegate?.locationManagerDidPauseLocationUpdates?(fakeInstance)
        case .didResume:
            delegate?.locationManagerDidResumeLocationUpdates?(fakeInstance)
        case let .didUpdateLocations(locations):
            delegate?.locationManager?(fakeInstance, didUpdateLocations: locations)
        }
    }
    #endif
    
    #if !os(watchOS) && !os(tvOS)
    public func updateVisits(event: Tasks.VisitsMonitoring.StreamEvent) {
        switch event {
        case let .didVisit(visit):
            delegate?.locationManager?(fakeInstance, didVisit: visit)
        case let .didFailWithError(error):
            delegate?.locationManager?(fakeInstance, didFailWithError: error)
        }
    }
    
    public func updateRegionMonitoring(event: Tasks.RegionMonitoring.StreamEvent) {
        switch event {
        case let .didEnterTo(region):
            delegate?.locationManager?(fakeInstance, didEnterRegion: region)
            
        case let .didExitTo(region):
            delegate?.locationManager?(fakeInstance, didExitRegion: region)
            
        case let .didStartMonitoringFor(region):
            delegate?.locationManager?(fakeInstance, didStartMonitoringFor: region)
            
        case let .monitoringDidFailFor(region, error):
            delegate?.locationManager?(fakeInstance, monitoringDidFailFor: region, withError: error)
            
        }
    }
    #endif
    
    public func validatePlistConfigurationForTemporaryAccuracy(purposeKey: String) throws {
        if let error = onRequestValidationForTemporaryAccuracy(purposeKey) {
            throw error
        }
    }
    
    public func validatePlistConfigurationOrThrow(permission: LocationPermission) throws {
        if let error = onValidatePlistConfiguration(permission) {
            throw error
        }
    }
    
    public func locationServicesEnabled() -> Bool {
        isLocationServicesEnabled
    }
    
    public func requestAlwaysAuthorization() {
        self.authorizationStatus = onRequestAlwaysAuthorization()
    }
    
    public func requestWhenInUseAuthorization() {
        self.authorizationStatus = onRequestWhenInUseAuthorization()
    }
    
    public func requestTemporaryFullAccuracyAuthorization(withPurposeKey purposeKey: String, completion: ((Error?) -> Void)? = nil) {
        self.accuracyAuthorization = .fullAccuracy
        completion?(nil)
    }
    
    public func startUpdatingLocation() {
        
    }
    
    public func stopUpdatingLocation() {
        
    }
    
    public func requestLocation() {
        
    }
    
    public func startMonitoring(for region: CLRegion) {
        
    }
    
    public func stopMonitoring(for region: CLRegion) {
        
    }
    
    public func startMonitoringVisits() {

    }
    
    public func stopMonitoringVisits() {
        
    }
    
    public func startMonitoringSignificantLocationChanges() {
        
    }
    
    public func stopMonitoringSignificantLocationChanges() {
        
    }
    
    public func startUpdatingHeading() {
        
    }
    
    public func stopUpdatingHeading() {
        
    }
    
    #if !os(watchOS) && !os(tvOS)
    public func startRangingBeacons(satisfying constraint: CLBeaconIdentityConstraint) {
        
    }
    
    public func stopRangingBeacons(satisfying constraint: CLBeaconIdentityConstraint) {
    
    }
    #endif
    
    public init() {
        
    }
}
