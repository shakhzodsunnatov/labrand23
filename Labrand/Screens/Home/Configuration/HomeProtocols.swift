//
//  HomeProtocols.swift
//  Labrand
//
//  Created by Shakhzod on 27/09/22.
//

import UIKit

//MARK: - ViewController
protocol HomePresenterOutput: AnyObject {
    
}

//MARK: - Interactor
protocol HomeInteractable: AnyObject {
    func getProducts() -> [ProductModel]
    func getProduct(_ index: Int) -> ProductModel
    func didSelectProduct(_ product: ProductModel)
    func openProductCard(_ model: ProductModel)
}

//MARK: - Presentable
protocol HomePresentable: AnyObject {
    
}

//MARK: - HomeRouting
protocol HomeRouting: AnyObject {
    func openProductCard(_ model: ProductModel)
}
