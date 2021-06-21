//
//  RecipeListViewController.swift
//  Recipe
//
//  Created by dhayalprema on 15/06/21.
//  Copyright © 2021 dhayalprema. All rights reserved.
//

import UIKit

class RecipeListViewController: UIViewController, AddRecipeDelegate {
    
    @IBOutlet weak var recipeTableView: UITableView!
    
    var model = RecipeModel()
    var selectedType: RecipeType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeTableView.dataSource = self
        recipeTableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "recipeDetail" {
            if let indexPath = recipeTableView.indexPathForSelectedRow {
                let recipe = model.recipes[indexPath.row]
                let detailVc = segue.destination as? RecipeDetailViewController
                detailVc?.recipe = recipe
            }
        } else if segue.identifier == "addRecipe" {
            let navVc = segue.destination as? UINavigationController
            let addVc = navVc?.viewControllers.first as? AddRecipeViewController
            addVc?.delegate = self
            addVc?.context = model.context
        }
    }
    
    @IBAction func recipeSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            selectedType = nil
        case 1:
            selectedType = .vegetarian
        default:
            selectedType = .meat
        }
        
        recipeTableView.reloadData()
    }
    
    func add(recipe: Recipe) {
        model.addRecipe(recipe: recipe)
        recipeTableView.reloadData()
    }
    
    
}

extension RecipeListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.burgers(forType: selectedType).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath)
        let recipes = model.burgers(forType: selectedType)[indexPath.row]
        cell.textLabel?.text = recipes.name
        cell.detailTextLabel?.text = recipes.ingredients
        cell.imageView?.image = recipes.bannerImage
        
        return cell;
    }
    
}

extension RecipeListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

