//
//  StringExtensions.swift
//
//
//  Created by Maksim Zoteev on 09.03.2024.
//

import Foundation

public extension String {
    func localize(_ bundle: Bundle = .main) -> String {
        NSLocalizedString(self, bundle: bundle, comment: "")
    }
}
