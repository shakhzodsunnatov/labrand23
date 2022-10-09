//
//  
//  CatalogView.swift
//  Labrand
//
//  Created by Shakhzod on 09/10/22.
//
//

import UIKit
import SnapKit

class CatalogView: BaseView {
    
    //MARK: - Properties
    let productCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionHeadersPinToVisibleBounds = true
        layout.minimumLineSpacing = 26
        layout.itemSize = CGSize(width: 165, height: 260)
        let paddingSide = (SCREEN_WIDTH - 330) / 3
        layout.sectionInset = UIEdgeInsets(top: 20, left: paddingSide, bottom: 50, right: paddingSide)
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.showsVerticalScrollIndicator = false
        collection.register(ProductCollectionItemCell.self, forCellWithReuseIdentifier: ProductCollectionItemCell.description())
        collection.register(CatalogCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CatalogCollectionReusableView.description())
        
        return collection
    }()
    
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - UI Setup
extension CatalogView {
    private func setupUI() {
        self.backgroundColor = .appColor(.viewBackground)
        
        addSubview(productCollectionView)
        
        productCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

