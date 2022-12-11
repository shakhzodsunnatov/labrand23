//
//  LoginRouter.swift
//  Labrand
//
//  Created by Shakhzod on 24/09/22.
//

import UIKit

class LoginRouter {
    
    //MARK: - Properties
    var viewController: LoginViewController?
    
}

//MARK: - LoginRouting
extension LoginRouter: LoginRouting {
    func openHome() {
        let homeViewController = HomeConfigurator.configureModule()
        viewController?.pushViewController(homeViewController)
    }
}
