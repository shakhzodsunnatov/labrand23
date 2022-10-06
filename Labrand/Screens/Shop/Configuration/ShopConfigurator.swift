//
//  
//  ShopConfigurator.swift
//  Labrand
//
//  Created by Shakhzod on 04/10/22.
//
//

import UIKit

class ShopConfigurator {
    
    static func configureModule() -> ShopViewController {
        
        // ViewController
        let viewController = ShopViewController()
        let view = ShopView()
        let routing = ShopRouter()
        let interactor = ShopInteractor()
        let presenter = ShopPresenter()
        
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
