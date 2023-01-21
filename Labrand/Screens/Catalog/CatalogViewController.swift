//
//  
//  CatalogViewController.swift
//  Labrand
//
//  Created by Shakhzod on 09/10/22.
//
//

import UIKit

class CatalogViewController: BaseViewController {

    //MARK: - Properties
    var superView: CatalogView?
    var interactor: CatalogInteractable?
    
    var products: [ProductModel] = MockData.instance.products
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.rootNavigation?.addLargeNavigationBarTitle()
        self.addBackButton()
        self.addLeftSearchButton()
        self.rootNavigation?.makeNavigationBarRegular()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.rootNavigation?.removeLargeNavigationBarTitle()
        self.navigationTraditionalTopBar()
    }
}

//MARK: - CatalogPresenterOutput
extension CatalogViewController: CatalogPresenterOutput {
    
}

//MARK: - ICollectionReusableViewDelegate
extension CatalogViewController: ICollectionReusableViewDelegate {
    func sortButtonPressed() {
        interactor?.sortButtonPressed()
    }
}

//MARK: - UICollectionViewDelegate
extension CatalogViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

//MARK: - UICollectionViewDataSource & UICollectionViewDelegateFlowLayout
extension CatalogViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: SCREEN_WIDTH, height: 82)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: CatalogCollectionReusableView.description(),
                for: indexPath) as! CatalogCollectionReusableView
            headerView.delegate = self
            
            return headerView
        
        default: assert(false, "Invalid element type")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionItemCell.description(), for: indexPath) as! ProductCollectionItemCell
        
        cell.configureBy(model: products[indexPath.row])
        
        return cell
    }
}

//MARK: - SetupUI
extension CatalogViewController {
    private func setupUI() {
        self.title = "Women's tops"
        self.view = superView
        
        self.superView?.productCollectionView.delegate = self
        self.superView?.productCollectionView.dataSource = self
    }
}
