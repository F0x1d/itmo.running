//
//  BaseButton.swift
//  
//
//  Created by Maksim Zoteev on 08.03.2024.
//

import Foundation
import SwiftUI

struct BaseButton: View {
    let label: String
    let loading: Bool
    let disabled: Bool
    let action: () -> Void
    
    init(_ label: String, loading: Bool = false, disabled: Bool = false, action: @escaping () -> Void) {
        self.label = label
        self.loading = loading
        self.disabled = disabled
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            buttonLabel
                .frame(maxWidth: .infinity, minHeight: 40)
        }
        .disabled(loading || disabled)
        .animation(.default, value: loading || disabled)
    }
    
    private var buttonLabel: some View {
        Group {
            if loading {
                ProgressView()
            } else {
                Text(LocalizedStringKey(label))
                    .bold()
            }
        }
    }
}
