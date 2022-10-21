//
//  CollectionDifferenceExtensions.swift
//
//  Based on code from https://www.swiftbysundell.com/articles/test-assertions-in-swift/
//
//  Created by Chris Richards on 21/10/2022.
//

import Foundation

public extension CollectionDifference {
    func testDescription(for change: Change) -> String? {
        switch change {
        case .insert(let index, let element, let association):
            if let oldIndex = association {
                return """
                Element moved from index \(oldIndex) to \(index): \(element)
                """
            } else {
                return "Additional element at index \(index): \(element)"
            }
        case .remove(let index, let element, let association):
            // If a removal has an association, it means that
            // it's part of a move, which we're handling above.
            guard association == nil else {
                return nil
            }

            return "Missing element at index \(index): \(element)"
        }
    }
}

public extension CollectionDifference {
    func asTestErrorMessage() -> String {
        let descriptions = compactMap(testDescription)

        guard !descriptions.isEmpty else {
            return ""
        }

        return "- " + descriptions.joined(separator: "\n- ")
    }
}
