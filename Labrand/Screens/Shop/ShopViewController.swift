//
//  
//  ShopViewController.swift
//  Labrand
//
//  Created by Shakhzod on 04/10/22.
//
//

import UIKit

class ShopViewController: BaseViewController {

    //MARK: - Properties
    var superView: ShopView?
    var interactor: ShopInteractor?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationTraditionalTopBar()
    }
    
}

//MARK: - ShopPresenterOutput
extension ShopViewController: ShopPresenterOutput {
    
}

//MARK: - Actions
extension ShopViewController {
    override func goBack() {
        self.tabBarController?.selectedIndex = 0
    }
}

//MARK: - UITableViewDelegate
extension ShopViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.showAnimation { [weak self] in
            
            let vc = CategoriesConfigurator.configureModule()
            self?.pushViewController(vc)
            
        }
    }
}

//MARK: - UITableViewDataSource
extension ShopViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: SaleTabeCell.description(), for: indexPath) as! SaleTabeCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableCell.description(), for: indexPath) as! CategoryTableCell
            cell.configure(index: indexPath.row)
            return cell
        }
    }
}

//MARK: - SetupUI
extension ShopViewController {
    private func setupUI() {
        self.view = superView
        self.superView?.tableView.delegate = self
        self.superView?.tableView.dataSource = self
        self.title = "Categories"
    }
}
