//
//  AddRecipeRouter.swift
//  CleanRecipes
//
//  Created by Giulia Iacovelli on 17/12/18.
//  Copyright (c) 2018 giulia. All rights reserved.
//

import UIKit

class AddRecipeRouter: NSObject {
    
    weak var viewController: AddRecipeViewController?
    
    static func assemble() -> UIViewController {
        
        let viewController = UIStoryboard(name: "AddRecipe", bundle: nil).instantiateViewController(withIdentifier: "AddRecipeViewController") as! AddRecipeViewController
        
        let presenter = AddRecipePresenter()
        let interactor = AddRecipeInteractor()
        let router = AddRecipeRouter()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        router.viewController = viewController
        
        return viewController
    }

}
