import XCTest
@testable import Recipes1

class ImageCacheTests: ImageCacheTestSetup {
    func testCacheDirectoryCreation() throws {
        let fileManager = FileManager.default
        
        XCTAssertTrue(fileManager.fileExists(atPath: imageCache.cacheDirectory.path))
    }
    
    func testCacheImage() async throws {
        await imageCache.cacheImage(named: testFileName, data: testImageData)
        let cachedImage = imageCache.getCachedImage(named: testFileName)
        
        XCTAssertNotNil(cachedImage)
    }
    
    func testGetCachedImage() throws {
        let fileURL = imageCache.cacheDirectory.appendingPathComponent(testFileName)
        try testImageData.write(to: fileURL)
        let cachedImage = imageCache.getCachedImage(named: testFileName)
        
        XCTAssertNotNil(cachedImage)
    }
}
