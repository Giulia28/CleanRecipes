//
//  RecipesListViewController.swift
//  CleanRecipes
//
//  Created by Giulia Iacovelli on 17/12/18.
//  Copyright (c) 2018 giulia. All rights reserved.
//

import UIKit
import CoreData

protocol RecipesListDisplayLogic: class {
    func reloadData(viewModel: RecipesList.RecipeList.ViewModel)
}

class RecipesListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, RecipesListDisplayLogic {

    var interactor: RecipesListBusinessLogic?
    var recipes: [RecipeDO]?
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchRecipes()
    }
    
    
    private func fetchRecipes() {
        self.interactor?.fetchRecipes()
    }
    
    //MARK: RecipesListDisplayLogic
    
    func reloadData(viewModel: RecipesList.RecipeList.ViewModel) {
        self.recipes = viewModel.recipes
        tableView.reloadData()
    }

    //MARK: IBActions
    
    @IBAction func addRecipe(_ sender: Any) {
        self.interactor?.addRecipe()
    }
    
    //MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell") as! RecipesListCellTableViewCell

        if let recipe = self.recipes?[indexPath.row] {
            cell.configure(name: recipe.name)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            print("delete")
        }
    }
    
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let recipe = self.recipes?[indexPath.row] {
            let request = RecipesList.RecipeDetail.Request(recipe: recipe)
            self.interactor?.selectRecipe(request: request)
        }
    }
}
