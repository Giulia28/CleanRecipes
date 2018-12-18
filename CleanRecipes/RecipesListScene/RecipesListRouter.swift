//
//  RecipesListRouter.swift
//  CleanRecipes
//
//  Created by Giulia Iacovelli on 17/12/18.
//  Copyright (c) 2018 giulia. All rights reserved.
//

import UIKit

protocol RecipesListRoutingLogic {
    func routeToAddRecipe()
    func routeToRecipeDetail(viewModel: RecipeDetail.RecipeDetail.ViewModel)
}

class RecipesListRouter: NSObject, RecipesListRoutingLogic {
    
    weak var viewController: RecipesListViewController?
    
    static func assemble() -> UIViewController {
        
        let viewController = UIStoryboard(name: "RecipesList", bundle: nil).instantiateViewController(withIdentifier: "RecipesListViewController") as! RecipesListViewController
        
        let presenter = RecipesListPresenter()
        let interactor = RecipesListInteractor()
        let router = RecipesListRouter()
        let worker = RecipesFetcher()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.viewController = viewController
        
        router.viewController = viewController
        interactor.router = router
        
        return viewController
    }
    
    func routeToAddRecipe() {
        let addRecipeViewController = AddRecipeRouter.assemble()
        self.viewController?.navigationController?.pushViewController(addRecipeViewController, animated: true)
    }
    
    func routeToRecipeDetail(viewModel: RecipeDetail.RecipeDetail.ViewModel) {
        let recipeDetailViewController = RecipeDetailRouter.assemble(viewModel: viewModel)
        self.viewController?.navigationController?.pushViewController(recipeDetailViewController, animated: true)

    }
}
