//
//  FilledButton.swift
//
//
//  Created by Maksim Zoteev on 08.03.2024.
//

import Foundation
import SwiftUI

public struct FilledButton: View {
    let label: String
    let loading: Bool
    let disabled: Bool
    let action: () -> Void
    
    public init(_ label: String, loading: Bool = false, disabled: Bool = false, action: @escaping () -> Void) {
        self.label = label
        self.loading = loading
        self.disabled = disabled
        self.action = action
    }
    
    public var body: some View {
        BaseButton(label, loading: loading, disabled: disabled, action: action)
            .buttonStyle(.borderedProminent)
    }
}

#Preview {
    VStack {
        FilledButton("Label") {
            NSLog("click")
        }
        .padding()
        
        FilledButton("Label", loading: true) {
            NSLog("click")
        }
        .padding()
    }
}
