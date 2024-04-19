//
//  HistoryView.swift
//
//
//  Created by Maksim Zoteev on 17.03.2024.
//

import Foundation
import SwiftUI
import SwiftData
import Data
import Extensions

public struct HistoryView: View {
    
    @Query private var trainings: [Training]
    
    public init() { }
    
    public var body: some View {
        NavigationStack {
            List {
                ForEach(trainings) { training in
                    HistoryItemView(training: training)
                }
            }
            .navigationTitle("history".localize(.module))
        }
    }
}

struct HistoryItemView: View {
    let training: Training
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(training.startTime.formatted())")
            Text("\(training.endTime.formatted())")
            
            Text("\(training.distance) m")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    HistoryView()
}
