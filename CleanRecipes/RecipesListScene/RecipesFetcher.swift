//
//  RecipesFetcher.swift
//  CleanRecipes
//
//  Created by Giulia Iacovelli on 17/12/18.
//  Copyright (c) 2018 giulia. All rights reserved.
//

import UIKit
import CoreData

class RecipesFetcher {
    
    func fetchRecipes() -> [NSManagedObject] {
        
        var recipes = [NSManagedObject]()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Recipe")
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                recipes.append(data)
            }
            
        } catch {
            print("Failed")
        }
     
        return recipes
    }
}
