//
//  RecipeListViewController.swift
//  Recipe
//
//  Created by dhayalprema on 15/06/21.
//  Copyright © 2021 dhayalprema. All rights reserved.
//

import UIKit

class RecipeListViewController: UIViewController {

    @IBOutlet weak var recipeTableView: UITableView!
    
    var model = RecipeModel()
    var selectedType: RecipeType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeTableView.dataSource = self
        recipeTableView.delegate = self
    }
    
    @IBAction func recipeSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0,2:
            selectedType = .vegetarian
        case 1:
            selectedType = .meat
        default:
            selectedType = .vegetarian
        }
        
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
        cell.imageView?.image = UIImage(named: recipes.thumbnailName)
        
        return cell;
    }
    
}

extension RecipeListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

