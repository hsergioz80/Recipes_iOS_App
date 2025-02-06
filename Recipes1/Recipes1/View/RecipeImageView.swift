//
//  RecipeImageView.swift
//  Recipes1
//
//  Created by sergio hernandez on 2/6/25.
//

import SwiftUI


class RecipeImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
}

struct RecipeImageView: View {
    
    @StateObject var vm: RecipeImageViewModel = RecipeImageViewModel()
    
    var body: some View {
        ZStack{
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }else if vm.isLoading{
                ProgressView()
            }else{
                Image(systemName: "questionmark")
                    .foregroundColor(Color.gray)
            }
        }
    }
}

#Preview {
    RecipeImageView()
}
