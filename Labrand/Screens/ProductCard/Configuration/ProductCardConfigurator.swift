//
//  
//  ProductCardConfigurator.swift
//  Labrand
//
//  Created by Shakhzod on 10/10/22.
//
//

import UIKit

class ProductCardConfigurator {
    
    static func configureModule(_ model: ProductModel) -> ProductCardViewController {
        
        // ViewController
        let viewController = ProductCardViewController()
        let view = ProductCardView()
        let routing = ProductCardRouter()
        let interactor = ProductCardInteractor(model)
        let presenter = ProductCardPresenter()
        
        // Configure
        viewController.superView = view
        viewController.interactor = interactor
        interactor.routing = routing
        interactor.presenter = presenter
        presenter.viewController = viewController
        routing.viewController = viewController
        
        return viewController
    }
}
