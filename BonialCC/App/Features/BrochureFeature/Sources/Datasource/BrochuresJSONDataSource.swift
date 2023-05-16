//
//  File.swift
//  
//
//  Created by Diego Pais on 16.05.23.
//

import Foundation

public protocol BrochureDataSource {
    func fetchBrochures() async -> TaskResult<[Brochure]>
}

extension JSONDataSource: BrochureDataSource {
    
    struct BrochureJSON: Codable {
        struct EmbeddedContent: Codable {
            let contents: [Brochure]
        }
        
        enum CodingKeys: String, CodingKey {
            case embedded = "_embedded"
        }
        
        let embedded: EmbeddedContent
    }
    
    public func fetchBrochures() async -> TaskResult<[Brochure]> {
        
        let result: TaskResult<BrochureJSON> = await fetchData(from: Bundle.main, fileName: "challenge")
        
        switch result {
        case let .success(data):
            return .success(data: data.embedded.contents)
        case let .failure(error):
            return .failure(error: error)
        }
    }
}
