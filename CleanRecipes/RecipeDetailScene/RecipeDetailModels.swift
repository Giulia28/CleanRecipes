//
//  RecipeDetailModels.swift
//  CleanRecipes
//
//  Created by Giulia Iacovelli on 18/12/18.
//  Copyright (c) 2018 giulia. All rights reserved.
//

import Foundation

enum RecipeDetail {
    
    // MARK: Use cases
    
    enum RecipeDetail {
        
        struct Request {
        }
        
        struct Response {
        }

        struct ViewModel {
            let recipe: RecipeDO?
        }
    }
}
