//
//  ImagesProvider.swift
//  Recipes1
//
//  Created by sergio hernandez on 2/8/25.
//

import Foundation
import SwiftUI

class ImagesProvider: ObservableObject {
    
    private var imageRepo: ImageCache?
    
    func fetchImage(_ url: URL, fileName: String) async throws -> UIImage?{
        if let image = await imageRepo?.loadImage(from: url, fileName: fileName) {
            return image
        }else{
            return UIImage(systemName: "person.crop.circle.badge.exclamationmark")!
        }
    }
    
    init(imageRepo: ImageCache = ImageCache()){
        self.imageRepo = imageRepo
    }
}
