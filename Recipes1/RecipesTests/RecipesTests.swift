//
//  RecipesTests.swift
//  RecipesTests
//
//  Created by sergio hernandez on 2/5/25.
//

import XCTest
@testable import Recipes1

class RecipesTests: XCTestCase {
    
    func testRecipeJSONDecoderDecodesRecipes() throws {
        let decoder = JSONDecoder()
        let recipes = try decoder.decode(Recipes.self, from: testFeature_nc73649170)
        
        XCTAssertEqual(recipes.recipes[1].name, "Apple & Blackberry Crumble")
    }
    
    func testClientDoesFetchRecipeData() async throws {
        let downloader = TestDownloader()
        let client = RecipeClient(downloader: downloader)
        let recipes = try await client.recipes
        
        XCTAssertEqual(recipes.recipes.count, 2)
    }
}
