//
//  ImageCacheTestSetup.swift
//  ImageCacheTestSetup
//
//  Created by sergio hernandez on 2/8/25.
//

import XCTest
@testable import Recipes1

class ImageCacheTestSetup: XCTestCase {
    
    var imageCache: ImageCache!
    var testImageData: Data!
    var testFileName: String!
    
    override func setUpWithError() throws {
        imageCache = ImageCache()
        testFileName = "testImage.png"
        
        // Create a test image data
        let testImage = UIImage(systemName: "star")!
        testImageData = testImage.pngData()
    }
}
