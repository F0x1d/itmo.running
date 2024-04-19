//
//  Training.swift
//
//
//  Created by Maksim Zoteev on 18.04.2024.
//

import Foundation
import SwiftData

@Model
public class Training {
    
    public var length: Float
    public var startTime: Int64
    public var endTime: Int64
    
    init(length: Float, startTime: Int64, endTime: Int64) {
        self.length = length
        self.startTime = startTime
        self.endTime = endTime
    }
}
