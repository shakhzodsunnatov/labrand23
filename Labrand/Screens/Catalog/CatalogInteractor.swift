//
//  
//  CatalogInteractor.swift
//  Labrand
//
//  Created by Shakhzod on 09/10/22.
//
//

import UIKit

class CatalogInteractor {
    
    //MARK: - Properties
    var presenter: CatalogPresentable?
    var routing: CatalogRouting?
    
}

//MARK: - CatalogInteractable
extension CatalogInteractor: CatalogInteractable {
    
    func sortButtonPressed() {
        routing?.openSort()
    }
    
}

