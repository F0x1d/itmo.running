//
//  SettingsView.swift
//  
//
//  Created by Maksim Zoteev on 17.03.2024.
//

import Foundation
import SwiftUI
import Extensions

public struct SettingsView: View {
    private static let TELEGRAM_URL = "https://t.me/f0x1d"
    
    public init() { }
    
    public var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack {
                        Image("LILBUDA", bundle: .main)
                            .resizable()
                            .cornerRadius(10)
                            .frame(width: 50, height: 50)
                        
                        Text("app_name".localize(.module))
                            .padding(.horizontal, 1)
                    }
                }
                
                Section("author".localize(.module)) {
                    Link("f0x1d".localize(.module), destination: URL(string: SettingsView.TELEGRAM_URL)!)
                }
            }
            .navigationTitle("settings".localize(.module))
        }
    }
}

#Preview {
    SettingsView()
}
