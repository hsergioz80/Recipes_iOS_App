//
//  ContentView.swift
//  Recipes1
//
//  Created by sergio hernandez on 2/5/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var provider: RecipesProvider
    @EnvironmentObject var iprovider: ImagesProvider
    @State private var error: RecipeError?
    @State private var hasError = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(RecipeHelpers.groupedRecipes(from: provider.recipes?.recipes ?? []).keys.sorted(), id: \.self) { cuisine in
                    Section(header: Text(RecipeHelpers.cuisineHeader(for: cuisine))) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(RecipeHelpers.groupedRecipes(from: provider.recipes?.recipes ?? [])[cuisine] ?? []) { recipe in
                                    RecipeRowView(provider: provider, iprovider: iprovider, image: UIImage(), recipe: recipe)
                                }
                            }
                        }
                    }
                }
            }
            .alert(isPresented: $hasError, content: {
                Alert(title: Text("Malformed Data"),
                      message: Text(provider.error?.localizedDescription ?? "")
                )
            })
            .navigationTitle(RecipeHelpers.navigationTitle(for: provider.recipes?.recipes, error: error))
            .refreshable {
                provider.handleRefresh()
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
