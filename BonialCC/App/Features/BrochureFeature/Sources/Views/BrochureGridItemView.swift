//
//  BrochureGridItemView.swift
//  BonialCC
//
//  Created by Diego Pais on 16.05.23.
//

import SwiftUI
import Kingfisher
import Factory

struct BrochureGridItemView: View {
    
    let theme: BTheme
    let brochure: Brochure
    let onSelectBrochure: ((Brochure) -> Void)?

    init(theme: BTheme, brochure: Brochure, onSelectBrochure: ((Brochure) -> Void)? = nil) {
        self.theme = theme
        self.brochure = brochure
        self.onSelectBrochure = onSelectBrochure
    }
    
    var body: some View {
        Button {
            onSelectBrochure?(brochure)
        } label: {
            VStack(alignment: .leading, spacing: theme.spacing.nothing) {
                BImage(url: brochure.content.imageUrl)
                    .accessibilityIdentifier("brochure-image")
                    .clipShape(RoundedRectangle(cornerRadius: theme.cornerRadius))
                    .overlay(RoundedRectangle(cornerRadius: theme.cornerRadius).stroke(Color.gray))
                    .frame(height: 280)
                
                VStack(alignment: .leading, spacing: theme.spacing.regular) {
                    Text(brochure.content.title)
                        .accessibilityIdentifier("brochure-title")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(theme.palette.black)
                        .lineLimit(3, reservesSpace: true)
                    
                    HStack(alignment: .top, spacing: theme.spacing.small) {
                        if let retailer = brochure.content.retailer {
                            Text(retailer.name)
                                .accessibilityIdentifier("brochure-retailer-name")
                                .foregroundColor(theme.palette.black)
                                .font(.footnote)
                        }
                        Spacer()
                        Text(brochure.content.formattedDistance)
                            .accessibilityIdentifier("brochure-distance")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(theme.palette.green)
                    }
                }
                .padding(theme.spacing.regular)
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
            BrochureGridItemView(theme: Container.shared.theme(), brochure: .template)
        }
        .frame(width: 200, height: 400)
        
    }
}
