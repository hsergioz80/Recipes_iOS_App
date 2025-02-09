//
//  RecipeError.swift
//  Recipes1
//
//  Created by sergio hernandez on 2/5/25.
//

import Foundation

enum RecipeError: Error {
    case missingData
    case networkError
    case unexpectedError(error: Error)
}

extension RecipeError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString("Found and will discard a wuake missing a valid cuisine, name, UUID, or photoURLLarge",
                                     comment: "")
        case .networkError:
            return NSLocalizedString("Error fetching quake data over the network",
                                     comment: "")
        case .unexpectedError(let error):
            return NSLocalizedString("Recieved unexpected error: \(error.localizedDescription)",
                                     comment: "")
        }
    }
}
