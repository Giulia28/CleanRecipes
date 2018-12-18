//
//  RecipeDetailRouter.swift
//  CleanRecipes
//
//  Created by Giulia Iacovelli on 18/12/18.
//  Copyright (c) 2018 giulia. All rights reserved.
//

import UIKit

class RecipeDetailRouter: NSObject {
    
    weak var viewController: RecipeDetailViewController?
    
    static func assemble(viewModel: RecipeDetail.RecipeDetail.ViewModel) -> UIViewController {
        
        let viewController = UIStoryboard(name: "RecipeDetail", bundle: nil).instantiateViewController(withIdentifier: "RecipeDetailViewController") as! RecipeDetailViewController
        
        let presenter = RecipeDetailPresenter()
        let interactor = RecipeDetailInteractor()
        let router = RecipeDetailRouter()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        viewController.recipe = viewModel.recipe
        
        router.viewController = viewController
        
        return viewController
    }
    
    func gotoScene2() {
        //        let scene2 = Scene2.assembleScene2()
        //        self.show(scene2, sender: self)
    }
    
}
