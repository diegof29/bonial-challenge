//
//  BrochureGridItemView.swift
//  BonialCC
//
//  Created by Diego Pais on 16.05.23.
//

import SwiftUI
import Kingfisher

struct BrochureGridItemView: View {
    
    let brochure: Brochure
    let onTapped: ((Brochure) -> Void)?

    init(brochure: Brochure, onTapped: ((Brochure) -> Void)? = nil) {
        self.brochure = brochure
        self.onTapped = onTapped
    }
    
    var body: some View {
        Button {
            onTapped?(brochure)
        } label: {
            VStack(alignment: .leading, spacing: 0) {
                BImage(url: brochure.content.imageUrl, placeholder: nil)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray))
                    .accessibilityIdentifier("brochure-image")
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(brochure.content.title)
                        .font(.body)
                        .fontWeight(.bold)
                        .lineLimit(3, reservesSpace: true)
                        .accessibilityIdentifier("brochure-title")
                    HStack(alignment: .top, spacing: 4) {
                        if let retailer = brochure.content.retailer {
                            Text(retailer.name)
                                .font(.footnote)
                                .accessibilityIdentifier("brochure-retailer-name")
                        }
                        Spacer()
                        Text(brochure.content.formattedDistance)
                            .font(.caption)
                            .accessibilityIdentifier("brochure-distance")
                    }
                }
                .padding(8.0)
            }
        }
        .buttonStyle(.plain)
        .frame(maxWidth: .infinity)
        .accessibilityIdentifier("brochure-\(brochure.id)")
//        .accessibilityAddTraits(.isButton)
    }
}

struct BrochureGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            BrochureGridItemView(
                brochure: Brochure(
                    contentType: "brochure",
                    content: Brochure.BrochureContent(
                        id: 12,
                        title: "WIEDER PREISE STREICHEN MACHT FREUDE",
                        retailer: Brochure.BrochureContent.Retailer(id: 1, name: "REWE"),
                        distance: 1.234,
                        imageUrl: URL(string: "https://content-media.bonial.biz/c7512e39-7cdd-49a6-863a-ded0a109eefe/preview.jpg")
                    )
                )
            )
        }
        .frame(width: 200, height: 400)
        
    }
}
