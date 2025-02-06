//
//  RecipeRow.swift
//  Recipes1
//
//  Created by sergio hernandez on 2/5/25.
//

import SwiftUI

struct RecipeRow: View {
    var recipe: Recipe
    
    var body: some View {
        VStack{
            Text(recipe.name)
            Text(recipe.cuisine)
        }
    }
}

#Preview {
    var previewRecipe = Recipe(cuisine: "British",
                                      name: "Bakewell Tart",
                                      uuid: "eed6005f-f8c8-451f-98d0-4088e2b40eb6",
                                      photoURLLarge: "https://some.url/large.jpg")
    RecipeRow(recipe: previewRecipe)
}
