//
//  MockBrochureDataSource.swift
//  BonialCC
//
//  Created by Diego Pais on 16.05.23.
//

import Foundation

struct MockBrochureDataSource: BrochureDataSource {
    
    let errorProbability: Int
    let brochures: [Brochure]
    
    init(
        errorProbability: Int = 0,
        brochures: [Brochure] = Brochure.allTemplates
    ) {
        self.errorProbability = errorProbability
        self.brochures = brochures
    }
    
    func fetchBrochures() async -> TaskResult<[Brochure]> {
        
        let isError = Int.random(in: 1...100) <= errorProbability
        
        if isError {
            return .failure(error: BError(message: "Couldn't load data"))
        }
        
        return .success(data: brochures)
    }
}
