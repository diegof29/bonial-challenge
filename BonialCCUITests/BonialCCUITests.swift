//
//  BonialCCUITests.swift
//  BonialCCUITests
//
//  Created by Diego Pais on 16.05.23.
//

import XCTest

final class BonialCCUITests: XCTestCase {

  
    func test_loadBrochuresAndDisplayDetail() throws {
        let app = XCUIApplication()
        
        app.launchArguments.append("-uiTestSuccess")
        app.launch()
        
        // The list should exist
        let brochureGridView = existingElement(app.scrollViews["brochures-list"])
        
        let firstBrochureGridItem = existingElement(brochureGridView.buttons["brochure-1262188890"])
        
        let titleLabel = existingElement(firstBrochureGridItem.staticTexts["brochure-title"])
        XCTAssertEqual(titleLabel.label, "WIEDER PREISE STREICHEN MACHT FREUDE")
        
        let distanceLabel = existingElement(firstBrochureGridItem.staticTexts["brochure-distance"])
        XCTAssertEqual(distanceLabel.label, "nearby")
        
        let retailerLabel = existingElement(firstBrochureGridItem.staticTexts["brochure-retailer-name"])
        XCTAssertEqual(retailerLabel.label, "Media-Markt")
        
        existingElement(firstBrochureGridItem.images["brochure-image"])

        // Open details
        firstBrochureGridItem.tap()
        
//      The details view should exist
        let brochureDetailView = existingElement(app.images["brochure-details-1262188890"], timeout: 0.5)
        
//        // Dismiss the details
        brochureDetailView.firstMatch.tap()
//
        existingElement(app.scrollViews["brochures-list"], timeout: 0.5)
    }
    
    //    MARK: Utils
        
    /// Runs a `XCTAssert` for the given element and return it if exists.
    @discardableResult
    private func existingElement(_ elementGetter: @autoclosure () -> XCUIElement) -> XCUIElement {
        let element = elementGetter()
        XCTAssertTrue(element.exists)
        return element
    }
    
    /// Wait for the existance of an element and returns it.
    @discardableResult
    private func existingElement(_ elementGetter: @autoclosure () -> XCUIElement, timeout: TimeInterval) -> XCUIElement {
        let element = elementGetter()
        _ = element.waitForExistence(timeout: timeout)
        XCTAssertTrue(element.exists)
        return element
    }
}
