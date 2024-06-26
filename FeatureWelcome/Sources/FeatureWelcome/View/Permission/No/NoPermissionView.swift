//
//  NoPermissionView.swift
//
//
//  Created by Maksim Zoteev on 10.03.2024.
//

import Foundation
import SwiftUI
import CoreUI
import CoreDI
import SwiftLocation
import Factory

public struct NoPermissionView: View {
    static let OPEN_SETTINGS_BUTTON_TEST_TAG = "open_settings_button"
        
    @InjectedObject(\.noPermissionViewModel) private var viewModel
    
    public init() { }
        
    public var body: some View {
        VStack {
            Spacer()
            textsBlock
            Spacer()
            
            FilledButton("open".localize(.module)) {
                viewModel.openSettings()
            }
            .padding()
            .accessibilityIdentifier(NoPermissionView.OPEN_SETTINGS_BUTTON_TEST_TAG)
        }
        .navigationBarBackButtonHidden()
    }
    
    private var textsBlock: some View {
        Group {
            HStack {
                Text("no_permission".localize(.module))
                    .font(.title)
                    .bold()
                    .padding(.horizontal, 1)
                
                Image(systemName: "xmark.octagon")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            
            Text("app_cant_work_without_permission".localize(.module))
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
    }
}

#Preview {
    NoPermissionView()
}
