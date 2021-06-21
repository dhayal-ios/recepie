//
//  RecipeModel.swift
//  Recipe
//
//  Created by dhayalprema on 15/06/21.
//  Copyright © 2021 dhayalprema. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class RecipeModel {
    
    var recipes: [Recipe] = []
    let context: NSManagedObjectContext
    
    init() {
        
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            if try context.count(for: Recipe.fetchRequest()) != 0 {
                 recipes = try context.fetch(Recipe.fetchRequest())
            }
        } catch {
            print(error)
        }
        
        /*if let url = Bundle.main.url(forResource: "BurgerResources/burgers", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let jsonRecipes = try JSONDecoder().decode([RecipeJSON].self, from: data)
            } catch {
                print(error)
            }
        }*/
    }
    
    func burgers(forType type: RecipeType?) -> [Recipe] {
        guard let type = type else { return recipes }
        return recipes.filter { $0.recipeType == type.rawValue }
    }
    
    func addRecipe(recipe: Recipe) {
        do {
            recipes.append(recipe)
            _ = Recipe(
                name: recipe.name!, ingredients: recipe.ingredients!, recipeType: RecipeType(rawValue: recipe.recipeType!)!, context: context
            )
            try context.save()
        } catch {
            print(error)
        }
    }
}
