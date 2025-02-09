//
//  RecipeHelpers.swift
//  Recipes1
//
//  Created by sergio hernandez on 2/8/25.
//

import Foundation

// Define the cuisine emojis in a struct or as a global constant
struct RecipeHelpers {
    static let cuisineEmojis: [String: String] = [
        "AMERICAN": "🇺🇸",
        "BRITISH": "🇬🇧",
        "CANADIAN": "🇨🇦",
        "CROATIAN": "🇭🇷",
        "FRENCH": "🇫🇷",
        "GREEK": "🇬🇷",
        "ITALIAN": "🇮🇹",
        "MALAYSIAN": "🇲🇾",
        "POLISH": "🇵🇱",
        "PORTUGUESE": "🇵🇹",
        "RUSSIAN": "🇷🇺",
        "TUNISIAN": "🇹🇳"
    ]
    
    // Function to group recipes by cuisine
    static func groupedRecipes(from recipes: [Recipe]) -> [String: [Recipe]] {
        return Dictionary(grouping: recipes, by: { $0.cuisine })
    }
    
    // Function to generate the cuisine header
    static func cuisineHeader(for cuisine: String) -> String {
        let capitalizedCuisine = cuisine.capitalized
        if let emoji = cuisineEmojis[cuisine.uppercased()] {
            return "\(capitalizedCuisine) \(emoji)"
        } else {
            return capitalizedCuisine
        }
    }
    
    // Function to generate the navigation title
    static func navigationTitle(for recipes: [Recipe]?, error: RecipeError?) -> String {
        if let recipes = recipes, !recipes.isEmpty {
            return "Recipes"
        }
        
        if let recipes = recipes, recipes.isEmpty && error == nil {
            return "No Recipes Available"
        }
        
        return ""
    }
}
