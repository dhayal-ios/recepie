//
//  AddRecipeViewController.swift
//  Recipe
//
//  Created by dhayalprema on 16/06/21.
//  Copyright © 2021 dhayalprema. All rights reserved.
//

import UIKit

protocol AddRecipeDelegate {
    func add(recipe: Recipe)
}

class AddRecipeViewController: UIViewController {

    @IBOutlet weak var newRecipeName: UITextField!
    @IBOutlet weak var newRecipeDetail: UITextView!
    
    let placeholderText = "Add Ingredients"
    
    var delegate: AddRecipeDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRecipeDetail.delegate = self
        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveNewRecipe(_ sender: Any) {
        guard let recipeName = newRecipeName.text else { return }
        let recipe = Recipe(name: recipeName,ingredients: newRecipeDetail.text,imageName: "",thumbnailName: "",type: RecipeType.vegetarian)
        delegate?.add(recipe: recipe)
        dismiss(animated: true)
    }
    
    @IBAction func cancelNewRecipe(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

extension AddRecipeViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if newRecipeDetail.textColor == UIColor.tertiaryLabel {
            newRecipeDetail.text = nil
            newRecipeDetail.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if newRecipeDetail.text == nil {
            newRecipeDetail.text = placeholderText
            newRecipeDetail.textColor = UIColor.tertiaryLabel
        }
    }
}
