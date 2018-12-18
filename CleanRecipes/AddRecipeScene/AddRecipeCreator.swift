//
//  AddRecipeCreator.swift
//  CleanRecipes
//
//  Created by Giulia Iacovelli on 17/12/18.
//  Copyright (c) 2018 giulia. All rights reserved.
//

import UIKit
import CoreData

class AddRecipeCreator {
    
    static func saveRecipe(name: String?, preparation: String?) -> Bool {
        guard let name = name, let preparation = preparation else { return false }
        
        var success = false
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Recipe", in: context)
        let recipe = NSManagedObject(entity: entity!, insertInto: context)
        
        recipe.setValue(name, forKey: "name")
        recipe.setValue(preparation, forKey: "preparation")
        
        do {
            try context.save()
            success = true
        } catch {
            success = false
            print("Failed saving")
        }

        return success
    }
}
