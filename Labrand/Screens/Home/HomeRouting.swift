//
//  HomeRouting.swift
//  Labrand
//
//  Created by Shakhzod on 27/09/22.
//

import UIKit

class HomeRouter {
    
    //MARK: - Properties
    var viewController: HomeViewController?
    
}

extension HomeRouter: HomeRouting {
    
    func openProductCard(_ model: ProductModel) {
        let productCardVC = ProductCardConfigurator.configureModule(model)
        let navigationController = BaseNavigationController(rootViewController: productCardVC)
        viewController?.presentViewController(navigationController)
    }
}
