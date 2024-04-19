//
//  TrackView.swift
//
//
//  Created by Maksim Zoteev on 17.03.2024.
//

import Foundation
import SwiftUI
import Factory
import MapKit
import Extensions

public struct TrackView: View {
    
    @InjectedObject(\.trackViewModel) private var viewModel
    
    public init() { }
    
    public var body: some View {
        NavigationStack {
            ScrollView {
                map
                
                LazyVStack {
                    ForEach(viewModel.items) { coordinate in
                        Text("\(coordinate)")
                    }
                }
            }
            .navigationTitle("track".localize(.module))
        }
    }
    
    private var map: some View {
        Group {
            if viewModel.currentLocation != nil {
                Map(
                    position: $viewModel.currentMapCameraPosition,
                    interactionModes: []
                ) {
                    ForEach(viewModel.items) { coordinate in
                        Marker("HELLO", coordinate: coordinate)
                    }
                }
            } else {
                VStack {
                    ProgressView()
                }
            }
        }
        .aspectRatio(1, contentMode: .fill)
    }
}

#Preview {
    TrackView()
}

extension CLLocationCoordinate2D: Identifiable {
    public var id: Double {
        self.latitude
    }
}
