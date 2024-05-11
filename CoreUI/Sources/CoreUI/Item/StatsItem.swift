//
//  StatsItem.swift
//
//
//  Created by Maksim Zoteev on 11.05.2024.
//

import Foundation
import SwiftUI

public struct StatsItem: View {
    private let title: String
    private let value: Any
    
    public init(title: String, value: Any) {
        self.title = title
        self.value = value
    }
    
    public var body: some View {
        VStack {
            Text(title)
                .bold()
            
            Text("\(value)")
        }
        .frame(maxWidth: .infinity)
    }
}
