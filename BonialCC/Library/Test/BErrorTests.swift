//
//  BErrorTests.swift
//  BonialCCTests
//
//  Created by Diego Pais on 16.05.23.
//

import XCTest
@testable import BonialCC

final class BErrorTests: XCTestCase {

    func test_messageShouldBeErrorDescription() throws {
        let message = "Some message"
        let error = BError(message: message)
        
        XCTAssertEqual(error.errorDescription, message)
    }
}
