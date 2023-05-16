//
//  File.swift
//  
//
//  Created by Diego Pais on 16.05.23.
//

import Foundation

public struct BError: Error, LocalizedError, Equatable {
    public var errorDescription: String?
    
    public init(message: String) {
        self.errorDescription = message
    }
}



