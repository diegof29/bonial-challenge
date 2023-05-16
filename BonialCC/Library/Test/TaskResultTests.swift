//
//  JSONDataSourceTests.swift
//  BonialCCTests
//
//  Created by Diego Pais on 16.05.23.
//

import XCTest
@testable import BonialCC

final class TaskResultTests: XCTestCase {

    func test_succsessCaseWithData_shouldReturnData() throws {
        let value = 3
        let result: TaskResult<Int> = .success(data: value)
    
        XCTAssertEqual(result.data, value)
    }
    
    func test_succsessCaseWithData_shouldNotHaveError() throws {
        let value = 3
        let result: TaskResult<Int> = .success(data: value)
    
        XCTAssertNil(result.error)
    }
    
    func test_succsessCaseWithError_shouldReturnAnError() throws {
        
        let result: TaskResult<Int> = .failure(error: BError(message: "Some error"))
    
        XCTAssertNotNil(result.error)
    }
}
