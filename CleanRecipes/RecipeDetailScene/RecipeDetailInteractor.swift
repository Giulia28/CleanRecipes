//
//  RecipeDetailInteractor.swift
//  CleanRecipes
//
//  Created by Giulia Iacovelli on 18/12/18.
//  Copyright (c) 2018 giulia. All rights reserved.
//

import Foundation

protocol RecipeDetailBusinessLogic {
    
    func doSomething(request: RecipeDetail.RecipeDetail.Request)
}

protocol RecipeDetailDataStore {
    
    //var name: String { get set }
}

class RecipeDetailInteractor: RecipeDetailBusinessLogic, RecipeDetailDataStore {
    
    var presenter: RecipeDetailPresentationLogic?
    var worker: RecipeDetailWorker?
    //var name: String = ""
    
    // MARK: Do something
    
    func doSomething(request: RecipeDetail.RecipeDetail.Request) {
//        worker = RecipeDetailWorker()
//        worker?.doSomeWork()
//        
//        let response = RecipeDetail.RecipeDetail.Response()
//        presenter?.presentSomething(response: response)
    }
}
