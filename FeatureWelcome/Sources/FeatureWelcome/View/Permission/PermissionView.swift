//
//  PermissionView.swift
//
//
//  Created by Maksim Zoteev on 09.03.2024.
//

import Foundation
import SwiftUI
import CoreUI
import CoreDI
import Factory

struct PermissionView: View {
    
    @InjectedObject(\.permissionViewModel) private var viewModel
    
    var body: some View {
        VStack {
            Spacer()
            textsBlock
            Spacer()
            
            FilledButton("grant".localize(.module)) {
                let _ = viewModel.requestPermission()
            }
            .padding()
            .accessibilityIdentifier("grant_button")
        }
        .navigationBarBackButtonHidden()
    }
    
    private var textsBlock: some View {
        Group {
            HStack {
                Text("location".localize(.module))
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal, 1)
                
                Image(systemName: "location")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
                        
            Text("location_permission".localize(.module))
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    PermissionView()
}
