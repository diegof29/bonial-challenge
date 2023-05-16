//
//  BrochureRepository.swift
//  
//
//  Created by Diego Pais on 16.05.23.
//

import Foundation

public protocol BrochureRepository {
    func fetch() async -> TaskResult<[Brochure]>
    func fetch(maxDistance: Double) async -> TaskResult<[Brochure]>
}
