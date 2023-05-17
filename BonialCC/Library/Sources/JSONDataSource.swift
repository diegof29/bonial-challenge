//
//  JSONDataSource.swift
//  
//
//  Created by Diego Pais on 16.05.23.
//

import Foundation
import Factory

public extension Container {
    var jsonDataSource: Factory<JSONDataSource?> { self { nil } }
}

public struct JSONDataSource {
    
    private let defaultDecoder: JSONDecoder
    
    public init() {
        defaultDecoder = JSONDecoder()
        defaultDecoder.dateDecodingStrategy = .iso8601
    }
    
    public func fetchData<T: Decodable>(from bundle: Bundle, fileName: String, decoder: JSONDecoder? = nil) async -> TaskResult<T> {
        guard let fileURL = bundle.url(forResource: fileName, withExtension: "json") else {
            return .failure(error: BError(message: "File not found"))
        }
        
        let loadDataTask = Task(priority: .background) {
            do {
                let data = try Data(contentsOf: fileURL)
                
                let decoder = decoder ?? defaultDecoder
                let decodedData = try decoder.decode(T.self, from: data)
                
                return TaskResult.success(data: decodedData)
                
            } catch {
                return TaskResult.failure(error: BError(message: error.localizedDescription))
            }
        }
        
        return await loadDataTask.value
    }
}
