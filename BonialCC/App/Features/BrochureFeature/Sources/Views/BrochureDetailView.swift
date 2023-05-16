//
//  BrochureDetailView.swift
//  BonialCC
//
//  Created by Diego Pais on 16.05.23.
//

import SwiftUI
import Kingfisher

struct BrochureDetailView: View {
    
    let brochure: Brochure
    let onDismiss: () -> Void
    
    public init(brochure: Brochure, onDismiss: @escaping () -> Void) {
        self.brochure = brochure
        self.onDismiss = onDismiss
    }
    
    var body: some View {
        VStack {
            ZStack {
                KFImage(brochure.content.imageUrl)
                    .resizable()
                    .scaledToFit()
            }
        }
        .frame(maxHeight: .infinity)
        .ignoresSafeArea()
        .background(
            KFImage(brochure.content.imageUrl)
                .resizable()
                .scaledToFill()
                .blur(radius: 100)
        )
        .onTapGesture {
            onDismiss()
        }
    }
}

struct BrochureDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BrochureDetailView(
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
        ) {}
    }
}
