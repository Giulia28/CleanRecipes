//
//  AddRecipeInteractor.swift
//  CleanRecipes
//
//  Created by Giulia Iacovelli on 17/12/18.
//  Copyright (c) 2018 giulia. All rights reserved.
//

import Foundation

protocol AddRecipeBusinessLogic {
    
    func saveRecipe(request: AddRecipe.Recipe.Request) -> Bool
}

protocol AddRecipeDataStore {
    
    //var name: String { get set }
}

class AddRecipeInteractor: AddRecipeBusinessLogic, AddRecipeDataStore {
    
    var presenter: AddRecipePresentationLogic?
    var worker: AddRecipeCreator?
    //var name: String = ""
    
    // MARK: Do something
    
    func saveRecipe(request: AddRecipe.Recipe.Request) -> Bool {
        return AddRecipeCreator.saveRecipe(name: request.name, preparation: request.preparation)
    }
}
