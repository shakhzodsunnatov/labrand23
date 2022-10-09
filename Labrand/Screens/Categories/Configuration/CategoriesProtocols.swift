//
//  
//  CategoriesProtocols.swift
//  Labrand
//
//  Created by Shakhzod on 09/10/22.
//
//

import UIKit

//MARK: - ViewController
protocol CategoriesPresenterOutput: AnyObject {
    
}

//MARK: - Interactor
protocol CategoriesInteractable: AnyObject {
    func didSelectRowAt(index: Int)
}

//MARK: - Presentable
protocol CategoriesPresentable: AnyObject {
    
}

//MARK: - HomeRouting
protocol CategoriesRouting: AnyObject {
    func openCatalog()
}
