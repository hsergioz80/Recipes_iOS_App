//
//  ImageCache.swift
//  Recipes1
//
//  Created by sergio hernandez on 2/6/25.
//

import Foundation
import UIKit

class ImageCache {
    
    var cacheDirectory: URL
    
    // Initialize cache with a directory to store cached files
    init() {
        let fileManager = FileManager.default
        do {
            // Create a directory for caching in the app's document directory
            let documentDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            self.cacheDirectory = documentDirectory.appendingPathComponent("ImageCache")
            
            // Create the directory if it doesn't exist
            if !fileManager.fileExists(atPath: cacheDirectory.path) {
                try fileManager.createDirectory(at: cacheDirectory, withIntermediateDirectories: true, attributes: nil)
            }
        } catch {
            fatalError("Could not create cache directory: \(error)")
        }
    }
    
    // Get cached image or nil if not cached
    func getCachedImage(named fileName: String) -> UIImage? {
        let fileURL = cacheDirectory.appendingPathComponent(fileName)
        guard let data = try? Data(contentsOf: fileURL) else {
            return nil
        }
        return UIImage(data: data)
    }
    
    // Cache the image data to disk
    func cacheImage(named fileName: String, data: Data) async {
        let fileURL = cacheDirectory.appendingPathComponent(fileName)
        do {
            try await writeToFile(url: fileURL, data: data)
        } catch {
            print("Error caching image: \(error)")
        }
    }
    
    // Load the image from the network if not cached, otherwise load from cache
    func loadImage(from url: URL, fileName: String) async -> UIImage? {
        // First, try to get from cache
        if let cachedImage = getCachedImage(named: fileName) {
            return cachedImage
        }
        
        // If not cached, download the image
        do {
            let imageData = try await downloadImageData(from: url)
            await cacheImage(named: fileName, data: imageData)
            return UIImage(data: imageData)
        } catch {
            print("Error downloading image: \(error)")
            return nil
        }
    }
    
    // Download image data from URL
    private func downloadImageData(from url: URL) async throws -> Data {
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
    
    // Helper function to write data to disk
    private func writeToFile(url: URL, data: Data) async throws {
        let _ = FileManager.default
        do {
            try data.write(to: url)
        } catch {
            throw error
        }
    }
}

