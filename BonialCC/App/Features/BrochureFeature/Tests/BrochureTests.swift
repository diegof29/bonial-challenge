//
//  BrochureTests.swift
//  BonialCCTests
//
//  Created by Diego Pais on 16.05.23.
//

import XCTest
@testable import BonialCC

final class BrochureTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_decodeBrochure_success() throws {
        let json =
            """
                {
                    "placement": "ad_placement__shelf_sort_managed",
                    "adFormat": "ad_format__brochure_card_cover",
                    "contentFormatSource": "destinationsApi",
                    "contentType": "brochure",
                    "content": {
                        "id": 1262188890,
                        "contentId": "213fab7b-18de-486a-a4ab-11f01471c006",
                        "title": "WIEDER PREISE STREICHEN MACHT FREUDE",
                        "validFrom": "2020-05-21T07:00:00.000+0000",
                        "validUntil": "3020-06-02T07:00:00.000+0000",
                        "publishedFrom": "2020-05-21T07:00:00.000+0000",
                        "publishedUntil": "3020-06-02T07:00:00.000+0000",
                        "type": "BROCHURE",
                        "pageCount": 6,
                        "publisher": {
                            "id": 1024,
                            "name": "MediaMarkt",
                            "type": "RETAILER"
                        },
                        "retailer": {
                            "id": 209835338,
                            "name": "Media-Markt"
                        },
                        "brochureImage": "https://content-media.bonial.biz/e5da490f-4f10-473a-a4b6-7ef7e8c387b0/preview.jpg",
                        "isEcommerce": true,
                        "distance": 0.2648915828765783,
                        "hideValidityDate": false
                    }
                }
        """
        
        let expectedBrochure = Brochure(
            contentType: "brochure",
            content: Brochure.BrochureContent(
                id: 1262188890,
                title: "WIEDER PREISE STREICHEN MACHT FREUDE",
                retailer: Brochure.BrochureContent.Retailer(id: 209835338, name: "Media-Markt"),
                distance: 0.2648915828765783,
                imageUrl: URL(string: "https://content-media.bonial.biz/e5da490f-4f10-473a-a4b6-7ef7e8c387b0/preview.jpg")
            )
        )
        let brochure = try Brochure.decodedFromJSONString(json)
        
        XCTAssertNotNil(brochure)
        XCTAssertEqual(brochure, expectedBrochure)
    }

    func test_decodeBrochureNoRetailer_success() throws {
        let json =
            """
                {
                    "placement": "ad_placement__shelf_sort_managed",
                    "adFormat": "ad_format__brochure_card_cover",
                    "contentFormatSource": "destinationsApi",
                    "contentType": "brochure",
                    "content": {
                        "id": 1262188890,
                        "contentId": "213fab7b-18de-486a-a4ab-11f01471c006",
                        "title": "WIEDER PREISE STREICHEN MACHT FREUDE",
                        "validFrom": "2020-05-21T07:00:00.000+0000",
                        "validUntil": "3020-06-02T07:00:00.000+0000",
                        "publishedFrom": "2020-05-21T07:00:00.000+0000",
                        "publishedUntil": "3020-06-02T07:00:00.000+0000",
                        "type": "BROCHURE",
                        "pageCount": 6,
                        "publisher": {
                            "id": 1024,
                            "name": "MediaMarkt",
                            "type": "RETAILER"
                        },
                        "brochureImage": "https://content-media.bonial.biz/e5da490f-4f10-473a-a4b6-7ef7e8c387b0/preview.jpg",
                        "isEcommerce": true,
                        "distance": 0.2648915828765783,
                        "hideValidityDate": false
                    }
                }
        """
        
        let brochure = try Brochure.decodedFromJSONString(json)
        
        XCTAssertNotNil(brochure)
        XCTAssertNil(brochure?.content.retailer)
    }
    
    func test_decodeBrochureNoImage_success() throws {
        let json =
            """
                {
                    "placement": "ad_placement__shelf_sort_managed",
                    "adFormat": "ad_format__brochure_card_cover",
                    "contentFormatSource": "destinationsApi",
                    "contentType": "brochure",
                    "content": {
                        "id": 1262188890,
                        "contentId": "213fab7b-18de-486a-a4ab-11f01471c006",
                        "title": "WIEDER PREISE STREICHEN MACHT FREUDE",
                        "validFrom": "2020-05-21T07:00:00.000+0000",
                        "validUntil": "3020-06-02T07:00:00.000+0000",
                        "publishedFrom": "2020-05-21T07:00:00.000+0000",
                        "publishedUntil": "3020-06-02T07:00:00.000+0000",
                        "type": "BROCHURE",
                        "pageCount": 6,
                        "publisher": {
                            "id": 1024,
                            "name": "MediaMarkt",
                            "type": "RETAILER"
                        },
                        "retailer": {
                            "id": 209835338,
                            "name": "Media-Markt"
                        },
                        "isEcommerce": true,
                        "distance": 0.2648915828765783,
                        "hideValidityDate": false
                    }
                }
        """
        
        let brochure = try Brochure.decodedFromJSONString(json)
        
        XCTAssertNotNil(brochure)
        XCTAssertNil(brochure?.content.imageUrl)
    }
    
    func test_distanceBiggerThan1_correctlyFormatted()  {
        let brochure = Brochure.template2km
        
        XCTAssertEqual(brochure.content.formattedDistance, "2.00 Km")
    }

    func test_distanceSmallerThan1_correctlyFormatted()  {
        let brochure = Brochure.template
        
        XCTAssertEqual(brochure.content.formattedDistance, "nearby")
    }
}
