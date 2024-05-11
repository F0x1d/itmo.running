//
//  TrackView.swift
//
//
//  Created by Maksim Zoteev on 17.03.2024.
//

import Foundation
import SwiftUI
import CoreUI
import Factory
import MapKit
import Extensions

public struct TrackView: View {
    
    @InjectedObject(\.trackViewModel) private var viewModel
    
    public init() { }
    
    public var body: some View {
        List {
            map.listRowInsets(EdgeInsets())
            
            Section {
                controls.listRowInsets(EdgeInsets())
            }
            
            if viewModel.monitoring {
                Section {
                    HStack(spacing: 1) {
                        StatsItem(title: "distance", value: "\(viewModel.distance.round(to: 1)) m")
                        StatsItem(title: "speed", value: "\(viewModel.speed.round(to: 1)) m/s")
                        StatsItem(title: "time", value: "\(Int(Date().timeIntervalSince(viewModel.startTime))) s")
                    }
                    
                    HStack(spacing: 1) {
                        StatsItem(title: "mid speed", value: "\(viewModel.midSpeed.round(to: 1)) m/s")
                    }
                }
            }
        }
    }
    
    private var map: some View {
        Group {
            Map(position: $viewModel.currentMapCameraPosition) {
                UserAnnotation()
                
                ForEach(viewModel.path) { location in
                    PathAnnotation(coordinate: location.wrapped.coordinate)
                }
            }.mapControls {
                MapUserLocationButton()
            }
        }
        .aspectRatio(1, contentMode: .fill)
    }
    
    private var controls: some View {
        Group {
            if viewModel.monitoring {
                OutlinedButton("stop".localize(.module)) {
                    viewModel.stopMonitoring()
                }
            } else {
                FilledButton("start".localize(.module)) {
                    viewModel.startMonitoring()
                }
            }
        }
    }
    
    private func StatsItem(
        title: String,
        value: Any
    ) -> some View {
        VStack {
            Text(title)
                .bold()
            
            Text("\(value)")
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    TrackView()
}
