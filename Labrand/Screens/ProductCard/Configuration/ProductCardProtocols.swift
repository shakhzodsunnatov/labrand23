//
//  
//  ProductCardProtocols.swift
//  Labrand
//
//  Created by Shakhzod on 10/10/22.
//
//

import UIKit

//MARK: - ViewController
protocol ProductCardPresenterOutput: AnyObject {
    
}

//MARK: - Interactor
protocol ProductCardInteractable: AnyObject {
    func getModel() -> ProductModel
}

//MARK: - Presentable
protocol ProductCardPresentable: AnyObject {
    
}

//MARK: - HomeRouting
protocol ProductCardRouting: AnyObject {
    
}
