//
//  
//  ProductCardInteractor.swift
//  Labrand
//
//  Created by Shakhzod on 10/10/22.
//
//

import UIKit

class ProductCardInteractor {
    
    //MARK: - Properties
    var presenter: ProductCardPresentable?
    var routing: ProductCardRouting?
    
    private let model: ProductModel!
    private let tableCells: [ProductCardTableCellType] = ProductCardTableCellType.allCases
    
    init(_ model: ProductModel) {
        self.model = model
    }
}

//MARK: - ProductCardInteractable
extension ProductCardInteractor: ProductCardInteractable {
    
    func getModel() -> ProductModel {
        return model
    }
    
    func getTableCells() -> [ProductCardTableCellType] {
        return tableCells
    }
    
    func getTableCellTypeBy(indexPath: IndexPath) -> ProductCardTableCellType {
        return ProductCardTableCellType.init(rawValue: indexPath.row) ?? .scrollImage
    }
}

