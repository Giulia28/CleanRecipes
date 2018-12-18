//
//  RecipesListInteractor.swift
//  CleanRecipes
//
//  Created by Giulia Iacovelli on 17/12/18.
//  Copyright (c) 2018 giulia. All rights reserved.
//

import Foundation

protocol RecipesListBusinessLogic {
    func fetchRecipes()
    func addRecipe()
    func selectRecipe(request: RecipesList.RecipeDetail.Request)
}

protocol RecipesListDataStore {
}

class RecipesListInteractor: RecipesListBusinessLogic, RecipesListDataStore {
    
    var presenter: RecipesListPresentationLogic?
    var worker: RecipesFetcher?
    var router: RecipesListRouter?
    
    func fetchRecipes() {
        let recipes = worker?.fetchRecipes()
        let response = RecipesList.RecipeList.Response(recipes: recipes)
        presenter?.presentRecipes(response: response)
    }
    
    func addRecipe() {
        self.router?.routeToAddRecipe()
    }
    
    func selectRecipe(request: RecipesList.RecipeDetail.Request) {
        let detailViewModel = RecipeDetail.RecipeDetail.ViewModel(recipe: request.recipe)
        self.router?.routeToRecipeDetail(viewModel: detailViewModel)
    }
}

