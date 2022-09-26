//
//  LoginViewController.swift
//  Labrand
//
//  Created by Shakhzod on 24/09/22.
//

import UIKit

class LoginViewController: BaseViewController {

    //MARK: - Properties
    var superView: LoginView?
    var interactor: LoginInteractor?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
}

//MARK: - ILoginView
extension LoginViewController: ILoginView {
    func nextButtonAction() {
        
    }
}

//MARK: - LoginPresenterOutput
extension LoginViewController: LoginPresentorOutput {
    
}

//MARK: - SutupUI
extension LoginViewController {
    private func setupUI() {
        self.view = superView
        superView?.delegate = self
    }
}
