//
//  ArrayExtension.swift
//  Edvora-iOS-First-Round
//
//  Created by Duncan Kent on 24/02/2022.
//

import Foundation

extension Array where Element: Hashable {
    func uniqued() -> Array {
        var buffer = Array()
        var added = Set<Element>()
        for elem in self {
            if !added.contains(elem) {
                buffer.append(elem)
                added.insert(elem)
            }
        }
        return buffer
    }
}
