//
//  
//  CategoriesInteractor.swift
//  Labrand
//
//  Created by Shakhzod on 09/10/22.
//
//

import UIKit

class CategoriesInteractor {
    
    //MARK: - Properties
    var presenter: CategoriesPresentable?
    var routing: CategoriesRouting?
    
}

//MARK: - CategoriesInteractable
extension CategoriesInteractor: CategoriesInteractable {
    
    func didSelectRowAt(index: Int) {
        routing?.openCatalog()
    }
    
}

