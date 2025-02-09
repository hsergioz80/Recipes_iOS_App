//
//  RecipeRow.swift
//  Recipes1
//
//  Created by sergio hernandez on 2/5/25.
//

import SwiftUI

struct RecipeRowView: View {
    @ObservedObject var provider: RecipesProvider
    @ObservedObject var iprovider: ImagesProvider
    @State var image: UIImage
    var recipe: Recipe
    @State private var isAnimated = false
    let transition = AnyTransition.scale.combined(with: .opacity)
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            VStack(alignment: .center) {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
            
                Text(recipe.name)
                    .font(.headline)
                    .multilineTextAlignment(.center)
            }
            Spacer()
        }
        .animation(.spring(), value: isAnimated)
        .transition(transition)
        .task {
            await fetchImage()
            isAnimated.toggle()
        }
    }
}

extension RecipeRowView {
    func fetchImage() async {
        do{
            image = try await iprovider.fetchImage(URL(string: recipe.photoURLLarge)!, fileName: recipe.uuid) ?? UIImage()
        }catch{
            
        }
    }
}

#Preview {
    let previewRecipe = Recipe(cuisine: "British",
                               name: "Bakewell Tart",
                               uuid: "eed6005f-f8c8-451f-98d0-4088e2b40eb6",
                               photoURLLarge: "https://some.url/large.jpg")
    
    RecipeRowView(provider: .init(), iprovider: .init(),  image: UIImage(), recipe: previewRecipe)
}
