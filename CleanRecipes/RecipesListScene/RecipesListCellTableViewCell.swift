//
//  RecipesListCellTableViewCell.swift
//  CleanRecipes
//
//  Created by Giulia Iacovelli on 17/12/18.
//  Copyright © 2018 giulia. All rights reserved.
//

import UIKit

class RecipesListCellTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(name: String?) {
        self.name.text = name
    }
}
