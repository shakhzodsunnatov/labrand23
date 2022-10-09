//
//  
//  ShopProtocols.swift
//  Labrand
//
//  Created by Shakhzod on 04/10/22.
//
//

import UIKit

//MARK: - ViewController
protocol ShopPresenterOutput: AnyObject {
    
}

//MARK: - Interactor
protocol ShopInteractable: AnyObject {
    func didSelectRowAt()
}

//MARK: - Presentable
protocol ShopPresentable: AnyObject {
    
}

//MARK: - HomeRouting
protocol ShopRouting: AnyObject {
    func openSubcategory()
}
