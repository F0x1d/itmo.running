//
//  OutlinedButton.swift
//
//
//  Created by Maksim Zoteev on 09.03.2024.
//

import Foundation
import SwiftUI

public struct OutlinedButton: View {
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
            .foregroundStyle(.black)
            .buttonStyle(.bordered)
    }
}

#Preview {
    VStack {
        OutlinedButton("Label") {
            NSLog("click")
        }
        .padding()
        
        OutlinedButton("Label", loading: true) {
            NSLog("click")
        }
        .padding()
    }
}
