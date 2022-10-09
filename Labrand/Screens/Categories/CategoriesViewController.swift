//
//  
//  CategoriesViewController.swift
//  Labrand
//
//  Created by Shakhzod on 09/10/22.
//
//

import UIKit

class CategoriesViewController: BaseViewController {

    //MARK: - Properties
    var superView: CategoriesView?
    var interactor: CategoriesInteractable?
    
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

//MARK: - CategoriesPresenterOutput
extension CategoriesViewController: CategoriesPresenterOutput {
    
}

//MARK: - ICategoriesDelegate
extension CategoriesViewController: ICategoriesDelegate {
    func viewAllButtonPressed() {
        
    }
}

//MARK: - UITableViewDelegate
extension CategoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor?.didSelectRowAt(index: indexPath.row)
    }
}

//MARK: - UITableViewDataSource
extension CategoriesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 16
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SubcategoryTableCell.description(), for: indexPath) as! SubcategoryTableCell
        cell.titleLabel.text = "Cardigans & Sweaters"
        return cell
    }
    
    
}

//MARK: - SetupUI
extension CategoriesViewController {
    private func setupUI() {
        self.view = superView
        
        self.title = "Categories"
        
        self.superView?.delegate = self
        self.superView?.tableView.delegate = self
        self.superView?.tableView.dataSource = self
    }
}
