//
//  RecipeModel.swift
//  Recipe
//
//  Created by dhayalprema on 15/06/21.
//  Copyright © 2021 dhayalprema. All rights reserved.
//

import Foundation

class RecipeModel {
    
    var recipes: [Recipe] = []
    
    init() {
        if let url = Bundle.main.url(forResource: "BurgerResources/burgers", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                recipes = try JSONDecoder().decode([Recipe].self, from: data)
            } catch {
                print(error)
            }
        }
    }
    
    func burgers(forType type: RecipeType?) -> [Recipe] {
        guard let type = type else { return recipes }
        return recipes.filter { $0.type == type }
    }
}
