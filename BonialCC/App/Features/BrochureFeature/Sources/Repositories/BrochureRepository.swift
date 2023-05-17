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
    func fetch() async -> TaskResult<[Brochure]>
    func fetch(maxDistance: Double) async -> TaskResult<[Brochure]>
}
