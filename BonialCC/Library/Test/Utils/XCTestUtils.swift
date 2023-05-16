//
//  XCTestUtils.swift
//  BonialCCTests
//
//  Created by Diego Pais on 16.05.23.
//

import Foundation
import XCTest
import Combine

extension XCTestCase {
    func waitUntil<T: Equatable>(
        _ propertyPublisher: Published<T>.Publisher,
        description: String? = nil,
        equals expectedValue: T,
        timeout: TimeInterval = 0.5,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        let expectation = XCTestExpectation(description: description ?? "Waiting for value \(expectedValue)")
        
        var cancellable: AnyCancellable?
        
        cancellable = propertyPublisher
            .dropFirst()
            .first(where: { value in
                print("Did arrive value ")
                print(value)
                return value == expectedValue
                
            })
            .sink { value in
                XCTAssertEqual(value, expectedValue, file: file, line: line)
                cancellable?.cancel()
                expectation.fulfill()
            }
        
        wait(for: [expectation], timeout: timeout)
    }
    
    func waitUntil<T>(
        _ propertyPublisher: Published<T>.Publisher,
        description: String? = nil,
        match: @escaping (T) -> Bool,
        timeout: TimeInterval = 0.5
    ) {
        let expectation = XCTestExpectation(description: description ?? "Waiting for matching value")
        
        var cancellable: AnyCancellable?
        
        cancellable = propertyPublisher
            .dropFirst()
            .first(where: { match($0) })
            .sink { value in
                cancellable?.cancel()
                expectation.fulfill()
            }
        
        wait(for: [expectation], timeout: timeout, enforceOrder: true)
    }
}
