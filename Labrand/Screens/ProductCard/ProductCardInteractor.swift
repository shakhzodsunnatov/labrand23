//
//  
//  ProductCardInteractor.swift
//  Labrand
//
//  Created by Shakhzod on 10/10/22.
//
//

import UIKit

class ProductCardInteractor {
    
    //MARK: - Properties
    var presenter: ProductCardPresentable?
    var routing: ProductCardRouting?
    
    var model: ProductModel!
    
    init(_ model: ProductModel) {
        self.model = model
    }
}

//MARK: - ProductCardInteractable
extension ProductCardInteractor: ProductCardInteractable {
    
    func getModel() -> ProductModel {
        return self.model
    }
}

