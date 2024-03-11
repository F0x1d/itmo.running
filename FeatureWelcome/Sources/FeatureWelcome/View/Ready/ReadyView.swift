//
//  ReadyView.swift
//
//
//  Created by Maksim Zoteev on 09.03.2024.
//

import Foundation
import SwiftUI
import CoreUI
import Factory

struct ReadyView: View {
    static let EXCELLENT_TEXT_TEST_TAG = "excellent_text"
    
    @InjectedObject(\.readyViewModel) private var viewModel
    
    var body: some View {
        VStack {
            Spacer()
            textsBlock
            Spacer()
            
            FilledButton("thanks".localize(.module)) {
                viewModel.ready()
            }
            .padding()
        }
        .navigationBarBackButtonHidden()
    }
    
    private var textsBlock: some View {
        Group {
            HStack {
                Text("excellent".localize(.module))
                    .font(.title)
                    .bold()
                    .padding(.horizontal, 1)
                    .accessibilityIdentifier(ReadyView.EXCELLENT_TEXT_TEST_TAG)
                
                Image(systemName: "wand.and.stars")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            
            Text("you_are_good_to_go".localize(.module))
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ReadyView()
}
