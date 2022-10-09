//
//  
//  CategoriesViewController.swift
//  Labrand
//
//  Created by Shakhzod on 09/10/22.
//
//

import UIKit

class CategoriesViewController: UIViewController {

    //MARK: - Properties
    var superView: CategoriesView?
    var interactor: CategoriesInteractor?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
}

//MARK: - CategoriesPresenterOutput
extension CategoriesViewController: CategoriesPresenterOutput {
    
}

//MARK: - SetupUI
extension CategoriesViewController {
    private func setupUI() {
        self.view = superView
    }
}
