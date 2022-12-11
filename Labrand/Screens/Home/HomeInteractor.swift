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
    
    private let products: [ProductModel] = MockData.instance.products
    
    //MARK: - Initialization
    init(networkService: ApiServiceProtocol) {
        self.networkService = networkService
    }
}

//MARK: - HomeInteractable
extension HomeInteractor: HomeInteractable {
    
    func getProducts() -> [ProductModel] { self.products }
    
    func getProduct(_ index: Int) -> ProductModel { self.products[index] }
    
    func didSelectProduct(_ product: ProductModel) {
        self.openProductCard(product)
    }
    
    func openProductCard(_ model: ProductModel) {
        routing?.openProductCard(model)
    }
}

//MARK: - Rest APIs
extension LoginInteractor {
    
}
