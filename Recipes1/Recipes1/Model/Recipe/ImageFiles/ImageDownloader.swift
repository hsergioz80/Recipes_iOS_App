//
//  ImageDownloader.swift
//  Recipes1
//
//  Created by sergio hernandez on 2/6/25.
//

import Foundation

class ImageDownloader {
    
    // Download image data from URL
    static func downloadImageData(from url: URL) async throws -> Data {
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
}
