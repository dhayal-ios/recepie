//
//  Recipe.swift
//  Recipe
//
//  Created by dhayalprema on 15/06/21.
//  Copyright © 2021 dhayalprema. All rights reserved.
//

import Foundation


struct Recipe: Decodable {
    var name:String
    var ingredients:String
    var imageName:String
    var thumbnailName:String
    var type:RecipeType
}

enum RecipeType: String,Decodable {
    case vegetarian = "vegetarian"
    case meat = "meat"
}
