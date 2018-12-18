//
//  AddRecipeViewController.swift
//  CleanRecipes
//
//  Created by Giulia Iacovelli on 17/12/18.
//  Copyright (c) 2018 giulia. All rights reserved.
//

import UIKit

protocol AddRecipeDisplayLogic: class {
    
}

class AddRecipeViewController: UIViewController, AddRecipeDisplayLogic {
    
    var interactor: AddRecipeBusinessLogic?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var preparationTextView: UITextView!
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: IBActions
    
    @IBAction func saveRecipe(_ sender: Any) {
        guard let name = nameTextField.text, let preparation = preparationTextView.text else { return }
        
        var request = AddRecipe.Recipe.Request()
        request.name = name
        request.preparation = preparation
        if let interactor = self.interactor, interactor.saveRecipe(request: request) == true {
            navigationController?.popViewController(animated: true)
        }
    }

}
