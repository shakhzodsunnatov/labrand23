//
//  
//  CatalogConfigurator.swift
//  Labrand
//
//  Created by Shakhzod on 09/10/22.
//
//

import UIKit

class CatalogConfigurator {
    
    static func configureModule() -> CatalogViewController {
        
        // ViewController
        let viewController = CatalogViewController()
        let view = CatalogView()
        let routing = CatalogRouter()
        let interactor = CatalogInteractor()
        let presenter = CatalogPresenter()
        
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
