//
//  RecipesListPresenter.swift
//  CleanRecipes
//
//  Created by Giulia Iacovelli on 17/12/18.
//  Copyright (c) 2018 giulia. All rights reserved.
//

import Foundation
import CoreData

protocol RecipesListPresentationLogic {
    
    func presentRecipes(response: RecipesList.RecipeList.Response)
}

class RecipesListPresenter: RecipesListPresentationLogic {

    weak var viewController: RecipesListDisplayLogic?
    
    func presentRecipes(response: RecipesList.RecipeList.Response) {
        guard let recipesData = response.recipes else { return }
        
        var recipes = [RecipeDO]()
        for recipeData in recipesData {
            let recipeDO = RecipeDO()
            recipeDO.name = (recipeData.value(forKey: "name") as! String)
            recipeDO.preparation = (recipeData.value(forKey: "preparation") as! String)
            recipes.append(recipeDO)
        }
        let viewModel = RecipesList.RecipeList.ViewModel(recipes: recipes)
        self.viewController?.reloadData(viewModel: viewModel)
    }
}
