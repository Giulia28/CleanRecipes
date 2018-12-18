//
//  RecipesListModels.swift
//  CleanRecipes
//
//  Created by Giulia Iacovelli on 17/12/18.
//  Copyright (c) 2018 giulia. All rights reserved.
//

import Foundation
import CoreData

enum RecipesList {
    
    // MARK: Use cases
    
    enum RecipeList {
        
        struct Request {
        }
        
        struct Response {
            let recipes: [NSManagedObject]?
        }

        struct ViewModel {
            let recipes: [RecipeDO]?
        }
    }
    
    enum RecipeDetail {
        
        struct Request {
            let recipe: RecipeDO?
        }
        
    }
}
