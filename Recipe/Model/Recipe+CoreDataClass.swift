//
//  Recipe+CoreDataClass.swift
//  Recipe
//
//  Created by dhayalprema on 21/06/21.
//  Copyright © 2021 dhayalprema. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

@objc(Recipe)
public class Recipe: NSManagedObject {

    convenience init(name: String,ingredients: String,image: UIImage? = nil,thumbnail: UIImage? = nil,recipeType: RecipeType,context: NSManagedObjectContext) {
        self.init(entity: Recipe.entity(),insertInto: context)
        self.name = name
        self.ingredients = ingredients
        self.image = image?.jpegData(compressionQuality: 1)
        self.thumbnail = thumbnail?.jpegData(compressionQuality: 1)
        self.recipeType = recipeType.rawValue
    }
    
    var thumbnailImage: UIImage? {
        if let data = self.thumbnail {
            return UIImage(data: data)
        } else {
            return nil
        }
    }
    
    var bannerImage: UIImage? {
        if let data = self.thumbnail {
            return UIImage(data: data)
        } else {
            return nil
        }
    }
}
