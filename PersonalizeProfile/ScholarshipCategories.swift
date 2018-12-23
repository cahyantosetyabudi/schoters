//
//  ScholarshipCategories.swift
//  PersonalizeProfile
//
//  Created by Cahyanto Setya Budi on 12/23/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import Foundation

struct ScholarshipCategories: Codable {
    let id: Int
    let name: String
    let slug: String
    let descriptionEng: String
    let descriptionId: String
    let createdAt: String
    let updatedAt: String
    let publishedAt: String
    let imageUrl: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        slug = try container.decode(String.self, forKey: .slug)
        descriptionEng = try container.decode(String.self, forKey: .descriptionEng)
        descriptionId = try container.decode(String.self, forKey: .descriptionId)
        createdAt = try container.decode(String.self, forKey: .createdAt)
        updatedAt = try container.decode(String.self, forKey: .updatedAt)
        publishedAt = try container.decode(String.self, forKey: .publishedAt)
        imageUrl = try container.decode(String.self, forKey: .imageUrl)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case slug
        case descriptionEng = "description_eng"
        case descriptionId = "description_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case publishedAt = "published_at"
        case imageUrl = "image_url"
    }
}
