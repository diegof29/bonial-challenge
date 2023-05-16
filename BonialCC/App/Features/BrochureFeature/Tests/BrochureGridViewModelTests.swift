//
//  BrochureGridViewModelTests.swift
//  BonialCCTests
//
//  Created by Diego Pais on 16.05.23.
//

import XCTest
import Combine
@testable import BonialCC

final class BrochureGridViewModelTests: XCTestCase {

    var repository: DefaultBrochureRepository!
    private var subscriptions = Set<AnyCancellable>()

    override func setUp() {
        super.setUp()
        repository = DefaultBrochureRepository(dataSource: MockBrochureDataSource())
    }
    
    override func tearDown() {
        super.tearDown()
        repository = nil
    }
    
    func test_loadBrochures_shouldUpdateBrochures() async throws {
        let brochures: [Brochure] = [.template, .template1km, .template2km, .premiumTemplate]
        let viewModel = BrochureGridViewModel(repository: repository)
        
        XCTAssertEqual([], viewModel.brochures)
        
        await viewModel.loadBrochures()
        
        XCTAssertEqual(brochures, viewModel.brochures)
    }
        
    func test_loadBrochuresWithError_shouldSetError() async throws {
        let repository = DefaultBrochureRepository(dataSource: MockBrochureDataSource(errorProbability: 100))
        let viewModel = BrochureGridViewModel(repository: repository)
        
        XCTAssertNil(viewModel.uiState.error)
        
        await viewModel.loadBrochures()
        
        XCTAssertNotNil(viewModel.uiState.error)
    }
    
    func test_didSelectBrochure_shouldUpdateSelectedBrochure() throws {
        let repository = DefaultBrochureRepository(dataSource: MockBrochureDataSource(errorProbability: 100))
        let viewModel = BrochureGridViewModel(repository: repository)
        let brochureToSelect = Brochure.allTemplates.first
        
        XCTAssertNil(viewModel.selectedBrochure)
        
        viewModel.didSelectBrochure(brochureToSelect)
        
        XCTAssertEqual(brochureToSelect, viewModel.selectedBrochure)
    }
}
