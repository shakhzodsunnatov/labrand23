//
//  
//  CatalogRouting.swift
//  Labrand
//
//  Created by Shakhzod on 09/10/22.
//
//

import UIKit

class CatalogRouter {
    
    //MARK: - Properties
    var viewController: CatalogViewController?
    
}

extension CatalogRouter: CatalogRouting {
    func openSort() {
        let vc = SortSheetViewController()
        vc.modalPresentationStyle = .pageSheet
        viewController?.present(vc, animated: true)
    }
}
