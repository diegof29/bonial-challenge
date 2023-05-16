//
//  Theme.swift
//  BonialCC
//
//  Created by Diego Pais on 16.05.23.
//

import Foundation

public struct Theme {
    
    public struct Spacing {
        public let nothing: CGFloat
        public let small: CGFloat
        public let regular: CGFloat
        public let medium: CGFloat
        public let large: CGFloat
    }
        
    public var spacing: Theme.Spacing
    public var cornerRadius: CGFloat
    
    init() {
        self.spacing = Spacing(nothing: 0, small: 4, regular: 8, medium: 12, large: 20)
        self.cornerRadius = 8
    }
}
