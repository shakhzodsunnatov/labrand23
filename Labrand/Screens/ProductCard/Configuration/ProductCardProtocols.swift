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
    func getTableCells() -> [ProductCardTableCellType]
    func getTableCellTypeBy(indexPath: IndexPath) -> ProductCardTableCellType
}

//MARK: - Presentable
protocol ProductCardPresentable: AnyObject {
    
}

//MARK: - HomeRouting
protocol ProductCardRouting: AnyObject {
    
}
