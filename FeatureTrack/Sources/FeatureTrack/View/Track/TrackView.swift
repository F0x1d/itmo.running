//
//  TrackView.swift
//
//
//  Created by Maksim Zoteev on 17.03.2024.
//

import Foundation
import SwiftUI
import Extensions

public struct TrackView: View {
    
    public init() { }
    
    public var body: some View {
        NavigationStack {
            List {
                
            }
            .navigationTitle("track".localize(.module))
        }
    }
}

#Preview {
    TrackView()
}