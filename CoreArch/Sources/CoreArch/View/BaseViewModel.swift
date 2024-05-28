//
//  BaseViewModel.swift
//
//
//  Created by Maksim Zoteev on 08.03.2024.
//

import Foundation
import SwiftUI
import Combine

@MainActor open class BaseViewModel: ObservableObject {
    
    public var compositeSubscription: Set<AnyCancellable> = []
    
    public init() { }
}
