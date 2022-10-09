//
//  
//  CategoriesRouting.swift
//  Labrand
//
//  Created by Shakhzod on 09/10/22.
//
//

import UIKit

class CategoriesRouter {
    
    //MARK: - Properties
    var viewController: CategoriesViewController?
    
}

extension CategoriesRouter: CategoriesRouting {
    
    func openCatalog() {
        let vc = CatalogConfigurator.configureModule()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
