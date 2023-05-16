//
//  DefaultBrochureRepository.swift
//  
//
//  Created by Diego Pais on 16.05.23.
//

import Foundation

public struct DefaultBrochureRepository: BrochureRepository {
    
    private let dataSource: BrochureDataSource
    
    public init(dataSource: BrochureDataSource) {
        self.dataSource = dataSource
    }
    
    public func fetch() async -> TaskResult<[Brochure]> {
        return await dataSource.fetchBrochures()
    }
    
    public func fetch(maxDistance: Double) async -> TaskResult<[Brochure]> {
        let result = await fetch()
        
        guard let data = result.data else {
            return result
        }
        return .success(data: data.filter({ $0.content.distance < maxDistance }))
    }
}
