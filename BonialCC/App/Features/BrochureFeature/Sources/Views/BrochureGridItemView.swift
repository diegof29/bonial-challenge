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
    let onSelectBrochure: ((Brochure) -> Void)?

    init(brochure: Brochure, onSelectBrochure: ((Brochure) -> Void)? = nil) {
        self.brochure = brochure
        self.onSelectBrochure = onSelectBrochure
    }
    
    var body: some View {
        Button {
            onSelectBrochure?(brochure)
        } label: {
            VStack(alignment: .leading, spacing: 0) {
                BImage(url: brochure.content.imageUrl)
                    .accessibilityIdentifier("brochure-image")
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray))
                    .frame(height: 280)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(brochure.content.title)
                        .accessibilityIdentifier("brochure-title")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .lineLimit(3, reservesSpace: true)
                    
                    HStack(alignment: .top, spacing: 4) {
                        if let retailer = brochure.content.retailer {
                            Text(retailer.name)
                                .accessibilityIdentifier("brochure-retailer-name")
                                .font(.footnote)
                        }
                        Spacer()
                        Text(brochure.content.formattedDistance)
                            .accessibilityIdentifier("brochure-distance")
                            .font(.caption)
                    }
                }
                .padding(8.0)
            }
        }
        .accessibilityIdentifier("brochure-\(brochure.id)")
        .buttonStyle(.plain)
        .frame(maxWidth: .infinity)
    }
}

struct BrochureGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            BrochureGridItemView(brochure: .template)
        }
        .frame(width: 200, height: 400)
        
    }
}
