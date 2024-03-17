//
//  File.swift
//  
//
//  Created by Maksim Zoteev on 09.03.2024.
//

import Foundation
import CoreArch
import SwiftUI
import Factory

final class ReadyViewModel: BaseViewModel {
    
    @Injected(\.welcomeStore) private var welcomeStore
    
    func ready() {
        withAnimation {
            welcomeStore.welcomed = true
        }
    }
}
