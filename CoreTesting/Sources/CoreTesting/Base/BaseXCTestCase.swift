//
//  BaseXCTestCase.swift
//  
//
//  Created by Maksim Zoteev on 12.05.2024.
//

import Foundation
import XCTest
import CoreDI
import Combine

open class BaseXCTestCase: XCTestCase {
    
    public var compositeSubscription: Set<AnyCancellable> = []
    
    override public func setUp() async throws {
        compositeSubscription = []
        di.reset()
    }
}

