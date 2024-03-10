//
//  AlwaysPermissionView.swift
//
//
//  Created by Maksim Zoteev on 10.03.2024.
//

import Foundation
import SwiftUI
import CoreUI
import CoreDI
import Factory

struct AlwaysPermissionView: View {
    
    @InjectedObject(\.alwaysPermissionViewModel) private var viewModel
    
    var body: some View {
        VStack {
            Spacer()
            textsBlock
            Spacer()
            
            FilledButton("grant".localize(.module)) {
                let _ = viewModel.requestAlwaysPermission()
            }
            .padding()
            .accessibilityIdentifier("grant_always_button")
        }
        .navigationBarBackButtonHidden()
    }
    
    private var textsBlock: some View {
        Group {
            HStack {
                Text("always".localize(.module))
                    .font(.title)
                    .bold()
                    .padding(.horizontal, 1)
                
                Image(systemName: "exclamationmark.bubble")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            
            Text("always_permission".localize(.module))
                .foregroundStyle(.secondary)
                .padding(.horizontal)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    AlwaysPermissionView()
}
