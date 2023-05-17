//
//  BrochureRepository.swift
//  
//
//  Created by Diego Pais on 16.05.23.
//

import Foundation
import Factory

/// Registers repository protocol in Factory
public extension Container {
    var brochureRepository: Factory<BrochureRepository?> { self { nil } }
}

public protocol BrochureRepository {
    
    /// Fetches all the brochures
    func fetch() async -> TaskResult<[Brochure]>
    
    /// Fetches the brochures and apply a filter by distance
    func fetch(maxDistance: Double) async -> TaskResult<[Brochure]>
}
