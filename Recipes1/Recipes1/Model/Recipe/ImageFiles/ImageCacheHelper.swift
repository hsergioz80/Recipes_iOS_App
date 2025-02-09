//
//  ImageCacheWrite.swift
//  Recipes1
//
//  Created by sergio hernandez on 2/6/25.
//

import Foundation

class ImageCacheWrite {
    
    // Helper function to write data to disk
    static func writeToFile(url: URL, data: Data) async throws {
        let _ = FileManager.default
        do {
            try data.write(to: url)
        } catch {
            throw error
        }
    }
}
