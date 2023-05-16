//
//  UIStateTests.swift
//  BonialCCTests
//
//  Created by Diego Pais on 16.05.23.
//

import XCTest
@testable import BonialCC

final class UIStateTests: XCTestCase {

    func test_initialStateIsLoadingFalse() throws {
        let uiState = UIState()
        XCTAssertFalse(uiState.isLoading)
    }
    
    func test_initialStateNoError() throws {
        
        let uiState = UIState()
        XCTAssertNil(uiState.error)
    }
    
    func test_startLoadingShouldTurnIsLoadingTrue() throws {
        
        var uiState = UIState()
        uiState.startLoading()
        
        XCTAssertTrue(uiState.isLoading)
    }
        
    func test_didFinishNoErrorShouldTurnIsLoadingFalse() throws {
        
        var uiState = UIState()
        uiState.didFinish(error: nil)
        
        XCTAssertFalse(uiState.isLoading)
    }
    
    func test_didFinishWithErrorShouldTurnIsLoadingFalse() throws {
        
        var uiState = UIState()
        uiState.didFinish(error: BError(message: "Error"))
        
        XCTAssertFalse(uiState.isLoading)
    }
    
    func test_didFinishWithErrorShouldHoldError() throws {
        
        let error = BError(message: "Error")
        var uiState = UIState()
        uiState.didFinish(error: error)
        
        XCTAssertNotNil(uiState.error)
        XCTAssertNotNil(error.localizedDescription, uiState.error?.localizedDescription ?? "")
    }
}
