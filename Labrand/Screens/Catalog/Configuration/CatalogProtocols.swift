//
//  
//  CatalogProtocols.swift
//  Labrand
//
//  Created by Shakhzod on 09/10/22.
//
//

import UIKit

//MARK: - ViewController
protocol CatalogPresenterOutput: AnyObject {
    
}

//MARK: - Interactor
protocol CatalogInteractable: AnyObject {
    func sortButtonPressed()
}

//MARK: - Presentable
protocol CatalogPresentable: AnyObject {
    
}

//MARK: - HomeRouting
protocol CatalogRouting: AnyObject {
    func openSort()
}
