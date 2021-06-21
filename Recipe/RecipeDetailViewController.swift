//
//  RecipeDetailViewController.swift
//  Recipe
//
//  Created by dhayalprema on 16/06/21.
//  Copyright © 2021 dhayalprema. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailRecipe: UITextView!
    
    var recipe: Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailImage.image = recipe.bannerImage
        detailNameLabel.text = recipe.name
        detailRecipe.text = recipe.ingredients
        // Do any additional setup after loading the view.
    }
    

    

}
