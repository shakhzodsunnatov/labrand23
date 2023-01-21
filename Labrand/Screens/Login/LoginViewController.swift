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
    var interactor: LoginInteractable?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        rootNavigation?.setTitleText("Login")
        rootNavigation?.addLargeNavigationBarTitle()
    }
}

//MARK: - Private
extension LoginViewController {
}

//MARK: - ILoginView
extension LoginViewController: ILoginView {
    
    func nextButtonAction(emailText: String, passwordText: String) {
        superView?.showButtonLoader(true)
        interactor?.nextButtonPressed()
        superView?.showButtonLoader(false)
    }
    
    func emailTextFieldChanging(_ text: String) {
        print(text)
    }
    
    func passwordTextFieldChanging(_ text: String) {
        print(text)
    }
}

//MARK: - LoginPresenterOutput
extension LoginViewController: LoginPresentorOutput {
    
}

//MARK: - SetupUI
extension LoginViewController {
    private func setupUI() {
        self.view = superView
        superView?.delegate = self
    }
}
