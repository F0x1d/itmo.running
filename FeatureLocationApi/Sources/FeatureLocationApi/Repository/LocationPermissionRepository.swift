//
//  LocationPermissionRepository.swift
//
//
//  Created by Maksim Zoteev on 11.05.2024.
//

import Foundation
import CoreDI
import Combine
import Factory
import SwiftLocation

public final class LocationPermissionRepository {
    
    public func observePermissionStatus(checkInitially: Bool = true) -> AnyPublisher<Bool, Never> {
        let location = di.location()
        let subject = CurrentValueSubject<Bool, Never>(
            checkInitially ? location.authorizationStatus == .authorizedAlways : true
        )
        
        var task: Task<Void, Never>? = nil
        
        return subject
            .handleEvents(
                receiveSubscription: { _ in
                    if let _ = task { return }
                    
                    task = Task { @MainActor in
                        for await event in await location.startMonitoringAuthorization() {
                            subject.send(event.authorizationStatus == .authorizedAlways)
                        }
                    }
                },
                receiveCompletion: { _ in task?.cancel() },
                receiveCancel: { task?.cancel() }
            )
            .removeDuplicates()
            .eraseToAnyPublisher()
    }
}
