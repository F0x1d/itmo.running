//
//  HistoryNavigator.swift
//
//
//  Created by Maksim Zoteev on 11.05.2024.
//

import Foundation
import CoreNavigation
import Data

final class HistoryNavigator: BaseNavigator<HistoryScreen> {
    func openDetails(_ training: Training) {
        openScreen(.details(training: training))
    }
}

enum HistoryScreen: Hashable {
    case details(training: Training)
}
