//
//  CurrentValueSubjectExtensions.swift
//
//
//  Created by Maksim Zoteev on 12.05.2024.
//

import Foundation
import Combine

public extension CurrentValueSubject where Failure == Never {
    var streamed: AsyncStream<Output> {
        AsyncStream { continuation in
            let cancellable = sink {
                continuation.yield($0)
            }
            
            continuation.onTermination = { _ in
                cancellable.cancel()
            }
        }
    }
}
