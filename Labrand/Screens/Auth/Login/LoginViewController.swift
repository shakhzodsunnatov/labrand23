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
        
        
        //MARK: - MocData Check
        var allCorrect = true
        
        if !emailText.contains("@")  {
            superView?.showEmailErrorLabel(emailError: true, errorMessage: "Not a valid email address. Should be your@email.com")
            allCorrect = false
        }

        if emailText == "qwerty@gmail.com" {
//            superView.emailTextField.viewState = .ok
        } else {
            superView?.showEmailErrorLabel(emailError: true)
            allCorrect = false
        }

        if passwordText != "12345" {
            superView?.showPasswordErrorLabel(passwordError: true)
            allCorrect = false
        }
        
        superView?.showButtonLoader(false)
        
        if allCorrect {
//            pushViewController(MainTapBarController())
        }
        
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
