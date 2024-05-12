//
//  HistoryItemView.swift
//
//
//  Created by Maksim Zoteev on 11.05.2024.
//

import Foundation
import SwiftUI
import CoreUI
import MapKit
import Data
import CoreLocation

struct HistoryItemView: View {
    let training: Training
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 0
        ) {
            VStack(
                alignment: .leading,
                spacing: 1
            ) {
                HStack {
                    Text("training".localize(.module))
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(training.endTime.formatted(date: .abbreviated, time: .omitted))
                        .foregroundStyle(.secondary)
                }
                .padding(.bottom, 1)
                                
                Text("\(Int(training.distance)) m")
                    .foregroundStyle(.secondary)
            }
            .padding()
            
            Map(
                initialPosition: .region(
                    MKCoordinateRegion(
                        center: training.coordinates.last!.wrapped,
                        span: MKCoordinateSpan(
                            latitudeDelta: 0.01,
                            longitudeDelta: 0.01
                        )
                    )
                ),
                interactionModes: []
            ) {
                ForEach(training.coordinates) { coordinate in
                    PathAnnotation(coordinate: coordinate.wrapped)
                }
            }
            .aspectRatio(3.5, contentMode: .fill)
        }
        .listRowInsets(EdgeInsets())
    }
}

#Preview {
    HistoryItemView(
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
