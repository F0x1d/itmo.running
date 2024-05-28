//
//  ContentViewModelTests.swift
//  ITMORunningTests
//
//  Created by Maksim Zoteev on 12.05.2024.
//

import Foundation
import XCTest
@testable import ITMORunning
import CoreTesting
import CoreDI

final class ContentViewModelTests: BaseXCTestCase {
    
    @MainActor
    func testShouldChangeCurrentTab() async {
        let viewModel = di.contentViewModel()
        
        viewModel.currentTab = ContentViewTab.track
        XCTAssertEqual(viewModel.currentTab, ContentViewTab.track)
        
        viewModel.currentTab = ContentViewTab.history
        XCTAssertEqual(viewModel.currentTab, ContentViewTab.history)
        
        viewModel.currentTab = ContentViewTab.track
        XCTAssertEqual(viewModel.currentTab, ContentViewTab.track)
    }
}
