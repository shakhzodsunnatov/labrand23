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
    
}

//MARK: - Rest APIs
extension LoginInteractor {
    
}
