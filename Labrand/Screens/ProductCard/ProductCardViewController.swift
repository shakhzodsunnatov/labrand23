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

//MARK: - UITableViewDelegate
extension ProductCardViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

//MARK: -
extension ProductCardViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor?.getTableCells().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let productCell = interactor?.getTableCellTypeBy(indexPath: indexPath) //TODO: - do All staff inside interactor
        let cellType = productCell?.tableCellType ?? UITableViewCell.self
        let cell = tableView.dequeueCell(cellType, indexPath: indexPath)
        
        switch productCell {
        case .scrollImage:
            
            print("scrollView")
            
        case .none: break
            
        }
        return cell
    }
    
    
}

//MARK: - SetupUI
extension ProductCardViewController {
    private func setupUI() {
        self.view = superView
        superView?.tableView.delegate = self
        superView?.tableView.dataSource = self
    }
}
