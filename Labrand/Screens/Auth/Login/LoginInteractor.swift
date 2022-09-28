//
//  LoginInteractor.swift
//  Labrand
//
//  Created by Shakhzod on 24/09/22.
//

import UIKit

class LoginInteractor {
    
    //MARK: - Propertise
   var presenter: LoginPresentable?
   var routing: LoginRouting?
    
    private var networkService: ApiServiceProtocol?
    
    //MARK: - Init
    init(networkService: ApiServiceProtocol) {
        self.networkService = networkService
    }
}

//MARK: - LoginInteractable
extension LoginInteractor: LoginInteractable {
    func nextButtonPressed() {
        
        //MARK: - MocData Check
        var allCorrect = true
        
//        if !emailText.contains("@")  {
//            superView?.showEmailErrorLabel(emailError: true, errorMessage: "Not a valid email address. Should be your@email.com")
//            allCorrect = false
//        }
//
//        if emailText == "qwerty@gmail.com" {
////            superView.emailTextField.viewState = .ok
//        } else {
//            superView?.showEmailErrorLabel(emailError: true)
//            allCorrect = false
//        }
//
//        if passwordText != "12345" {
//            superView?.showPasswordErrorLabel(passwordError: true)
//            allCorrect = false
//        }
//
//        superView?.showButtonLoader(false)
        
        if allCorrect {
//            pushViewController(MainTapBarController())
        }
        
        routing?.openHome()
    }
}

//MARK: - Rest APIs
extension LoginInteractor {
    
}
