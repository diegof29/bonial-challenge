//
//  BrochureTemplate.swift
//  BonialCC
//
//  Created by Diego Pais on 16.05.23.
//

import Foundation

extension Brochure {
    public static let template = Brochure(
        contentType: .brochure,
        content: Brochure.BrochureContent(
            id: 1262188890,
            title: "WIEDER PREISE STREICHEN MACHT FREUDE",
            retailer: Brochure.BrochureContent.Retailer(id: 209835338, name: "Media-Markt"),
            distance: 0.2648915828765783,
            imageUrl: URL(string: "https://content-media.bonial.biz/e5da490f-4f10-473a-a4b6-7ef7e8c387b0/preview.jpg")
        )
    )
    
    static let template1km = Brochure(
        contentType: .brochure,
        content: Brochure.BrochureContent(
            id: 2,
            title: "WIEDER PREISE STREICHEN MACHT FREUDE",
            retailer: Brochure.BrochureContent.Retailer(id: 209835338, name: "Media-Markt"),
            distance: 1.0,
            imageUrl: URL(string: "https://content-media.bonial.biz/411d4511-d664-47ac-b19e-70086ad30821/preview.jpg")
        )
    )
    
    static let template2km = Brochure(
        contentType: .brochure,
        content: Brochure.BrochureContent(
            id: 3,
            title: "WIEDER PREISE STREICHEN MACHT FREUDE",
            retailer: Brochure.BrochureContent.Retailer(id: 209835338, name: "Media-Markt"),
            distance: 2.0,
            imageUrl: URL(string: "https://content-media.bonial.biz/b67cdb92-3ca7-4bbf-b3f5-837406963feb/preview.jpg")
        )
    )
    
    static let template6km = Brochure(
        contentType: .brochure,
        content: Brochure.BrochureContent(
            id: 4,
            title: "WIEDER PREISE STREICHEN MACHT FREUDE",
            retailer: Brochure.BrochureContent.Retailer(id: 209835338, name: "Media-Markt"),
            distance: 6.0,
            imageUrl: URL(string: "https://content-media.bonial.biz/e5da490f-4f10-473a-a4b6-7ef7e8c387b0/preview.jpg")
        )
    )
    
    static let premiumTemplate = Brochure(
        contentType: .brochurePremium,
        content: Brochure.BrochureContent(
            id: 5,
            title: "WIEDER PREISE STREICHEN MACHT FREUDE",
            retailer: Brochure.BrochureContent.Retailer(id: 209835338, name: "Media-Markt"),
            distance: 0.2648915828765783,
            imageUrl: URL(string: "https://content-media.bonial.biz/e5da490f-4f10-473a-a4b6-7ef7e8c387b0/preview.jpg")
        )
    )
    
    static let allTemplates: [Brochure] = [.template, .template1km, template2km, .template6km, .premiumTemplate]
}
