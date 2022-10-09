//
//  
//  CategoriesConfigurator.swift
//  Labrand
//
//  Created by Shakhzod on 09/10/22.
//
//

import UIKit

class CategoriesConfigurator {
    
    static func configureModule() -> CategoriesViewController {
        
        // ViewController
        let viewController = CategoriesViewController()
        let view = CategoriesView()
        let routing = CategoriesRouter()
        let interactor = CategoriesInteractor()
        let presenter = CategoriesPresenter()
        
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
