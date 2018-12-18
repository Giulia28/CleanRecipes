//
//  RecipeDetailViewController.swift
//  CleanRecipes
//
//  Created by Giulia Iacovelli on 18/12/18.
//  Copyright (c) 2018 giulia. All rights reserved.
//

import UIKit

protocol RecipeDetailDisplayLogic: class {
    
    func displayRecipe(recipe: RecipeDO?)
}

class RecipeDetailViewController: UIViewController, RecipeDetailDisplayLogic {
    
    var interactor: RecipeDetailBusinessLogic?
    var recipe: RecipeDO?
    
    @IBOutlet weak var preparationTextView: UITextView!
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayRecipe(recipe: recipe)
    }
    
    func displayRecipe(recipe: RecipeDO?) {
        self.title = recipe?.name
        self.preparationTextView.text = recipe?.preparation
    }
}
