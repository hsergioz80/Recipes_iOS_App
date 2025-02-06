//
//  ContentView.swift
//  Recipes1
//
//  Created by sergio hernandez on 2/5/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var provider: RecipesProvider
    @State private var error: RecipeError?
    @State private var hasError = false

    
    var body: some View {
        NavigationStack {
            List{
                ForEach(provider.recipes?.recipes ?? []){ recipe in
                    RecipeRow(recipe: recipe)
                }
            }
        }
        .task {
            await fetchRecipes()
        }
    }
}

extension ContentView {
    func fetchRecipes() async {
        do{
            try await provider.fetchRecipes()
        }catch {
            self.error = error as? RecipeError ?? .unexpectedError(error: error)
            self.hasError = true
        }
    }
}
#Preview {
    ContentView()
}
