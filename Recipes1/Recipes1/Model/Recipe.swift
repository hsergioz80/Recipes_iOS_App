//
//  Recipe.swift
//  Recipes1
//
//  Created by sergio hernandez on 2/5/25.
//

import Foundation

struct Recipes: Decodable {
    let recipes: [Recipe]
}
struct Recipe{
    let cuisine: String
    let name: String
    let uuid: String
    let photoURLLarge: String
}

extension Recipe: Identifiable{
    var id: String { uuid }
}

extension Recipe: Decodable{
    
    private enum CodingKeys: String, CodingKey {
        case cuisine
        case name
        case uuid
        case photoURLLarge = "photo_url_large"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let rawCuisine = try? values.decode(String.self, forKey: .cuisine)
        let rawName = try? values.decode(String.self, forKey: .name)
        let rawUUID = try? values.decode(String.self, forKey: .uuid)
        let rawPhotoURLLarge = try? values.decode(String.self, forKey: .photoURLLarge)
        
        guard let cuisine = rawCuisine,
              let name = rawName,
              let uuid = rawUUID,
              let photoURLLarge = rawPhotoURLLarge
                else {
            throw RecipeError.missingData
        }
        
        self.cuisine = cuisine
        self.name = name
        self.uuid = uuid
        self.photoURLLarge = photoURLLarge
    }
}

