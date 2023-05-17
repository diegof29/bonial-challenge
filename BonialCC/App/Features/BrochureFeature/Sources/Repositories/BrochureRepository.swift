//
//  BrochureRepository.swift
//  
//
//  Created by Diego Pais on 16.05.23.
//

import Foundation
import Factory

/// Registers repository protocol in Factory
///  Here I register only the protocol, the concrete implementation is registered at the App level.
///  This has some disadvantages, like the dependency is optional, but allows you to put the interface and
///  implementation in different modules if needed.
public extension Container {
    var brochureRepository: Factory<BrochureRepository?> { self { nil } }
}

public protocol BrochureRepository {
    
    /// Fetches all the brochures
    func fetch() async -> TaskResult<[Brochure]>
    
    /// Fetches the brochures and apply a filter by distance
    func fetch(maxDistance: Double) async -> TaskResult<[Brochure]>
}
