//
//  RecipeClient.swift
//  Recipes1
//
//  Created by sergio hernandez on 2/5/25.
//

import Foundation

class RecipeClient {
    
    //initializes an array of Recipes from the retrived data according to Recipes data structure
    var recipes: Recipes{
        get async throws{
            let data = try await downloader.httpData(from: feedURL)
            let allRecipes = try decoder.decode(Recipes.self, from: data)
            return allRecipes
        }
    }
    
    //assigning decoder to decode JSON structure
    private lazy var decoder: JSONDecoder = {
        let aDecoder = JSONDecoder()
        return aDecoder
    }()
    
    //URL that data is being fetched from
    private let feedURL = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")!
    
    private let downloader: any HTTPDataDownloader
    
    init(downloader: any HTTPDataDownloader = URLSession.shared){
        self.downloader = downloader
    }
}
