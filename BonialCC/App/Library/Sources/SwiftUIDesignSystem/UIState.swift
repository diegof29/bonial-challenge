//
//  UIState.swift
//  BonialCC
//
//  Created by Diego Pais on 16.05.23.
//

import Foundation

public struct UIState {
    public var isLoading = false
    public var error: BError?
    
    public init() { }
    
    public mutating func startLoading() {
        isLoading = true
        error = nil
    }
    
    public mutating func didFinish(error: BError? = nil) {
        isLoading = false
        self.error = error
    }
}
