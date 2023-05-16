//
//  DefaultBrochureRepositoryTests.swift
//  BonialCCTests
//
//  Created by Diego Pais on 16.05.23.
//

import XCTest
@testable import BonialCC

final class DefaultBrochureRepositoryTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
    }
    
    func test_fetchAllBrochures_shouldSuccess() async throws {
                
        let allBrochures = Brochure.allTemplates
        let repository = DefaultBrochureRepository(dataSource: MockBrochureDataSource(brochures: allBrochures))
        
        let result = await repository.fetch()
        
        XCTAssertNotNil(result.data)
            
        XCTAssertEqual(allBrochures.count, result.data?.count)
        XCTAssertEqual(allBrochures, result.data)
    }
    
    func test_fetchFilterdByDistance_shouldSuccess() async throws {
                
        let allBrochures: [Brochure] = [.template, .template1km, .template2km, .template6km, .premiumTemplate]
        let expectedBrochures: [Brochure] = [.template, .template1km, .premiumTemplate]
        let repository = DefaultBrochureRepository(dataSource: MockBrochureDataSource(brochures: allBrochures))
        
        let result = await repository.fetch(maxDistance: 2)

        XCTAssertNotNil(result.data)
        XCTAssertEqual(expectedBrochures.count, result.data?.count)
        XCTAssertEqual(expectedBrochures, result.data)
    }
    
    func test_fetchAllWithError_shouldReturnError() async throws {
                
        let repository = DefaultBrochureRepository(dataSource: MockBrochureDataSource(errorProbability: 100))
        
        let result = await repository.fetch()
        
        XCTAssertNotNil(result.error)
        XCTAssertNil(result.data)
    }
    
    func test_fetchFilteredWithError_shouldReturnError() async throws {
                
        let repository = DefaultBrochureRepository(dataSource: MockBrochureDataSource(errorProbability: 100))
        
        let result = await repository.fetch(maxDistance: 5)
        
        XCTAssertNotNil(result.error)
        XCTAssertNil(result.data)
    }
}
