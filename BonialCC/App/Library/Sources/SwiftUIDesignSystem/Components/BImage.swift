//
//  BImage.swift
//  BonialCC
//
//  Created by Diego Pais on 16.05.23.
//

import SwiftUI
import Kingfisher

struct BImage: View {
    
    let url: URL?
    let placeholder: Image
    
    init(url: URL?, placeholder: Image = Image("img-placeholder")) {
        self.url = url
        self.placeholder = placeholder
    }
    
    var body: some View {
        
        ZStack {
            KFImage(url)
                .resizable()
                .placeholder {
                    placeholder
                        .resizable()
                        .scaledToFit()
                }
                .scaledToFit()
                .clipped()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("surface"))
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            BImage(
                url: URL(string: "https://content-media.bonial.biz/411d4511-d664-47ac-b19e-70086ad30821/preview.jpg")
            )
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .frame(width: 160, height: 200)
    }
}
