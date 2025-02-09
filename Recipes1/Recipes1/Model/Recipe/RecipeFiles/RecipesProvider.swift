//
//  RecipesProvider.swift
//  Recipes1
//
//  Created by sergio hernandez on 2/5/25.
//

import Foundation
import SwiftUI

@MainActor
class RecipesProvider: ObservableObject{
    @Published var recipes: Recipes?
    @Published var error : Error?
    
    let client: RecipeClient
    
    func fetchRecipes() async throws {
        let latestRecipes = try await client.recipes
        self.recipes = latestRecipes
    }
    
    func handleRefresh(){
        recipes?.recipes.removeAll()
        loadData()
    }
    
    func loadData(){
        Task(priority: .medium){
            try await fetchRecipes()
        }
    }
    
    init(client: RecipeClient = RecipeClient()){
        self.client = client
    }
}
