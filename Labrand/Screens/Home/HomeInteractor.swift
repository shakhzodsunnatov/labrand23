//
//  HomeInteractor.swift
//  Labrand
//
//  Created by Shakhzod on 27/09/22.
//

import UIKit

class HomeInteractor {
    
    //MARK: - Properties
    var presenter: HomePresentable?
    var routing: HomeRouting?
    
    private let networkService:  ApiServiceProtocol?
    
    //MARK: - Initialization
    init(networkService: ApiServiceProtocol) {
        self.networkService = networkService
    }
}

//MARK: - HomeInteractable
extension HomeInteractor: HomeInteractable {
    
}

//MARK: - Rest APIs
extension LoginInteractor {
    
}
