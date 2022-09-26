//
//  LoginConfigurator.swift
//  Labrand
//
//  Created by Shakhzod on 24/09/22.
//

import UIKit

class LoginConfigurator {
    
    static func configureModule() -> LoginViewController {
        let viewController = LoginViewController()
        let view = LoginView()
        let router = LoginRouter()
        let interactor = LoginInteractor(networkService: ApiService.shared)
        let presenter = LoginPresenter()
        
        viewController.superView = view
        viewController.interactor = interactor
        interactor.presenter = presenter
        interactor.routing = router
        presenter.viewController = viewController
        router.viewController = viewController
        
        
        return viewController
    }
}
