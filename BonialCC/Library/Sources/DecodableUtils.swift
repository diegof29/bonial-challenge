//
//  DecodableUtils.swift
//  BonialCC
//
//  Created by Diego Pais on 16.05.23.
//

import Foundation

/// Syntax sugar to decode an entity from a json string
public extension Decodable {
    static func decodedFromJSONString(_ jsonString: String) throws -> Self? {
        guard let data = jsonString.data(using: .utf8) else {
            return nil
        }
        return try JSONDecoder().decode(Self.self, from: data)
    }
}
