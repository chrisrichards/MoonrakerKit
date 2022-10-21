//
//  Asserts.swift
//
//  Based on code from https://www.swiftbysundell.com/articles/test-assertions-in-swift/
//
//  Created by Chris Richards on 21/10/2022.
//

import Foundation
import XCTest

func AssertEqual<T: BidirectionalCollection>(
    _ first: T,
    _ second: T,
    file: StaticString = #file,
    line: UInt = #line
) where T.Element: Hashable {
    let diff = second.difference(from: first).inferringMoves()
    let message = diff.asTestErrorMessage()

    XCTAssert(message.isEmpty, """
    The two collections are not equal. Differences:
    \(message)
    """, file: file, line: line)
}
