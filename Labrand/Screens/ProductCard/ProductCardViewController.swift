//
//  
//  ProductCardViewController.swift
//  Labrand
//
//  Created by Shakhzod on 10/10/22.
//
//

import UIKit

class ProductCardViewController: UIViewController {

    //MARK: - Properties
    var superView: ProductCardView?
    var interactor: ProductCardInteractable?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
}

//MARK: - ProductCardPresenterOutput
extension ProductCardViewController: ProductCardPresenterOutput {
    
}

//MARK: - SetupUI
extension ProductCardViewController {
    private func setupUI() {
        self.view = superView
    }
}
