//
//  File.swift
//  
//
//  Created by Diego Pais on 16.05.23.
//

import Foundation

public struct Brochure: Codable, Identifiable, Equatable {
    
    public struct BrochureContent: Codable, Equatable {
        
        enum CodingKeys: String, CodingKey {
            case id
            case title
            case retailer
            case distance
            case imageUrl = "brochureImage"
        }
        
        public struct Retailer: Equatable, Codable {
            public let id: Int
            public let name: String
        }
        
        public let id: Int
        public let title: String
        public let retailer: Retailer?
        public let distance: Double
        public let imageUrl: URL?
        
        public var formattedDistance: String {
            if distance < 1 {
                return "nearby"
            }
            return String(format: "%.2f Km", distance)
        }
    }
    
    public enum ItemContentType: String, Codable {
        case brochure
        case brochurePremium
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    public var id: Int {
        return content.id
    }
    public let contentType: ItemContentType
    public let content: BrochureContent
}
