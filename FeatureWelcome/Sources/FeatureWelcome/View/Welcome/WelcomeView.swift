//
//  WelcomeView.swift
//
//
//  Created by Maksim Zoteev on 08.03.2024.
//

import Foundation
import SwiftUI
import CoreUI
import Extensions
import Factory

public struct WelcomeView: View {
    static let HELLO_BUTTON_TEST_TAG = "hello_button"
    
    @InjectedObject(\.navigator) private var navigator
    
    public init() { }
    
    public var body: some View {
        NavigationStack(path: $navigator.path) {
            rootContent
                .navigationDestination(for: navigator.screenType) { screen in
                    switch screen {
                    case .permission:
                        PermissionView()
                    case .alwaysPermission:
                        AlwaysPermissionView()
                    case .noPermission:
                        NoPermissionView()
                    case .ready:
                        ReadyView()
                    }
                }
        }
    }
    
    private var rootContent: some View {
        VStack {
            Spacer()
            textsBlock
            Spacer()
            
            FilledButton("hello".localize(.module)) {
                navigator.openPermissionScreen()
            }
            .padding()
            .accessibilityIdentifier(WelcomeView.HELLO_BUTTON_TEST_TAG)
        }
    }
    
    private var textsBlock: some View {
        Group {
            HStack {
                Text("app_name".localize(.module))
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal, 1)
                
                Image(systemName: "wind")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            
            Text("app_description".localize(.module))
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    WelcomeView()
}
