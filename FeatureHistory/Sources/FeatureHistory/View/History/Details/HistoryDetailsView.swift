//
//  File.swift
//  
//
//  Created by Maksim Zoteev on 11.05.2024.
//

import Foundation
import SwiftUI
import CoreUI
import Data
import MapKit

struct HistoryDetailsView: View {
    let training: Training
    
    private var midSpeed: Double {
        training.distance / (training.endTime.timeIntervalSince(training.startTime))
    }
    
    var body: some View {
        List {
            Map(
                initialPosition: .region(
                    MKCoordinateRegion(
                        center: training.coordinates.last!.wrapped,
                        span: MKCoordinateSpan(
                            latitudeDelta: 0.01,
                            longitudeDelta: 0.01
                        )
                    )
                )
            ) {
                ForEach(training.coordinates) { coordinate in
                    PathAnnotation(coordinate: coordinate.wrapped)
                }
            }
            .mapControls {
                MapUserLocationButton()
            }
            .aspectRatio(1, contentMode: .fill)
            .listRowInsets(EdgeInsets())
            
            Section {
                HStack(spacing: 1) {
                    StatsItem(title: "distance".localize(), value: "\(training.distance.round(to: 1)) m")
                    StatsItem(title: "mid_speed".localize(), value: "\(midSpeed.round(to: 1)) m/s")
                    StatsItem(title: "time".localize(), value: "\(Int(training.endTime.timeIntervalSince(training.startTime))) s")
                }
            }
        }
        .navigationTitle(training.endTime.formatted())
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    HistoryDetailsView(
        training: Training(
            distance: 567.567,
            startTime: Date(),
            endTime: Date(),
            coordinates: [
                IdentifiableLocationCoordinate(id: 0, wrapped: CLLocationCoordinate2D())
            ]
        )
    )
}
