//
//  Theme.swift
//  BonialCC
//
//  Created by Diego Pais on 16.05.23.
//

import Foundation
import SwiftUI
import Factory

public extension Container {
    var theme: Factory<BTheme> { self { BTheme() }.cached }
}


// This struct contains a set of properties to standarize the design in the app.
// If needed the values can be loaded from the server, to be able to adapt colors, etc
public struct BTheme {
    
    public struct BSpacing {
        public let nothing: CGFloat
        public let small: CGFloat
        public let regular: CGFloat
        public let medium: CGFloat
        public let large: CGFloat
    }
    
    public struct BColorPalette {
        public let primary: Color
        public let surface: Color
        
        public let black: Color
        public let green: Color
    }
        
    public var spacing: BSpacing
    public var palette: BColorPalette
    public var cornerRadius: CGFloat
    
    init() {
        self.spacing = BSpacing(nothing: 0, small: 4, regular: 8, medium: 12, large: 16)
        self.cornerRadius = 12
        self.palette = BColorPalette(
            primary: Color("primary"),
            surface: Color("surface"),
            black: Color("black"),
            green: Color("green")
        )
    }
}
