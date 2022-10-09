//
//  
//  ShopRouting.swift
//  Labrand
//
//  Created by Shakhzod on 04/10/22.
//
//

import UIKit

class ShopRouter {
    
    //MARK: - Properties
    var viewController: ShopViewController?
    
}

extension ShopRouter: ShopRouting {
    func openSubcategory() {
        let vc = CategoriesConfigurator.configureModule()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
