//
//  HomeViewController.swift
//  Labrand
//
//  Created by Shakhzod on 27/09/22.
//

import UIKit

class HomeViewController: BaseViewController {

    //MARK: - Properties
    var superView: HomeView?
    var interactor: HomeInteractable?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        rootNavigation?.hideNavigationBar()
    }
}

//MARK: - HomePresenterOutput
extension HomeViewController: HomePresenterOutput {
    
}

//MARK: - Banner Check Button
extension HomeViewController: BannerCheckButtonDelegate {
    
    func checkButtonPressed() {
        
    }
}

//MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
}

//MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 378
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(ProductsTableCell.self, indexPath: indexPath)

        cell.configure(
            products: interactor?.getProducts(),
            cellTitle: "News",
            subTitle: "Super summer sale"
        )
        
        cell.completionShowAllButton = { [weak self] in
            debugPrint("View All Tapped!!")
        }
        
        cell.completionDidSelectItemAt = { [weak self] product in
            debugPrint("Product Tapped \(String(describing: product?.title))")
            guard let self, let product else { return }
            self.interactor?.didSelectProduct(product)
        }
        
        return cell
    }
}

//MARK: -
extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        superView?.headerBannerView.scrollViewDidScroll(scrollView)
    }
}

//MARK: - SetupUI
extension HomeViewController {
    private func setupUI() {
        
        self.view = superView
        superView?.tableView.delegate = self
        superView?.tableView.dataSource = self
        superView?.headerBannerView.delegate = self
    }
}
