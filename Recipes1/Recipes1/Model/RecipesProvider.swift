//
//  RecipesProvider.swift
//  Recipes1
//
//  Created by sergio hernandez on 2/5/25.
//

import Foundation

@MainActor
class RecipesProvider: ObservableObject{
    @Published var recipes: Recipes?
    
    let client: RecipeClient
    
    func fetchRecipes() async throws {
        let latestRecipes = try await client.recipes
        self.recipes = latestRecipes
    }
    
    init(client: RecipeClient = RecipeClient()){
        self.client = client
    }
}
