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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            ZStack {
                KFImage(brochure.content.imageUrl)
                    .resizable()
                    .scaledToFill()
                    .blur(radius: 100, opaque: true)
            }
        )
        .onTapGesture {
            onDismiss()
        }
    }
}

struct BrochureDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BrochureDetailView(brochure: .template) {}
    }
}
