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
import Factory

public struct HistoryView: View {
    
    @Query(
        sort: \Training.endTime,
        order: .reverse
    ) 
    private var trainings: [Training]
    
    @InjectedObject(\.navigator) private var navigator
    
    public init() { }
    
    public var body: some View {
        NavigationStack(path: $navigator.path) {
            List {
                ForEach(trainings) { training in
                    Section {
                        HistoryItemView(training: training) {
                            navigator.openDetails($0)
                        }
                    }
                }
            }
            .navigationDestination(for: navigator.screenType) { screen in
                switch screen {
                case .details(let training):
                    HistoryDetailsView(training: training)
                }
            }
            .navigationTitle("history".localize())
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    HistoryView()
}
