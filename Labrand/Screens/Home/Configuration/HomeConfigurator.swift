//
//  HomeConfigurator.swift
//  Labrand
//
//  Created by Shakhzod on 27/09/22.
//

import UIKit

class HomeConfigurator {
    
    static func configureModule() -> HomeViewController {
        
        // ViewController
        let viewController = HomeViewController()
        let view = HomeView()
        let routing = HomeRouter()
        let interactor = HomeInteractor(networkService: ApiService.shared)
        let presenter = HomePresenter()
        
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
