//
//  TestData.swift
//  RecipesTests
//
//  Created by sergio hernandez on 2/5/25.
//

import Foundation


let testFeature_nc73649170: Data = """
    {
        "recipes": [
            {
                "cuisine": "British",
                "name": "Bakewell Tart",
                "photo_url_large": "https://some.url/large.jpg",
                "photo_url_small": "https://some.url/small.jpg",
                "uuid": "eed6005f-f8c8-451f-98d0-4088e2b40eb6",
                "source_url": "https://some.url/index.html",
                "youtube_url": "https://www.youtube.com/watch?v=some.id"
            },
            {
                "cuisine": "British",
                "name": "Apple & Blackberry Crumble",
                "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/large.jpg",
                "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/small.jpg",
                "source_url": "https://www.bbcgoodfood.com/recipes/778642/apple-and-blackberry-crumble",
                "uuid": "599344f4-3c5c-4cca-b914-2210e3b3312f",
                "youtube_url": "https://www.youtube.com/watch?v=4vhcOwVBDO4"
            }
        ]
    }
    """.data(using: .utf8)!

