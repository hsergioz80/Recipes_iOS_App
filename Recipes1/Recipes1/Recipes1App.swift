//
//  Recipes1App.swift
//  Recipes1
//
//  Created by sergio hernandez on 2/5/25.
//

import SwiftUI

@main
struct Recipes1App: App {
    @StateObject var recipesProvider = RecipesProvider()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recipesProvider)
        }
    }
}
