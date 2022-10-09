//
//  CatalogCollectionReusableView.swift
//  Labrand
//
//  Created by Shakhzod on 09/10/22.
//

import UIKit
import SnapKit

protocol ICollectionReusableViewDelegate: AnyObject {
    func sortButtonPressed()
}

class CatalogCollectionReusableView: UICollectionReusableView {
    
    //MARK: - Properties
    private let categoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = .clear
        collection.register(CategoryBtnCollectionCell.self, forCellWithReuseIdentifier: CategoryBtnCollectionCell.description())
        
        return collection
    }()
    
    private lazy var sortStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [filterButton, sortButton, groupingButton])
        stack.distribution = .equalSpacing
        stack.backgroundColor = .appColor(.viewBackground)
        
        return stack
    }()
    
    private var filterButton: Button = {
        let button = Button()
        button.image = UIImage(systemName: "line.3.horizontal.decrease")
        button.title = "Filters"
        button.tintColor = .black0
        button.font = .lightFont(ofSize: 13)
        button.titleColor = .black0
        
        return button
    }()
    
    private lazy var sortButton: Button = {
        let button = Button()
        button.image = UIImage(systemName: "arrow.up.arrow.down")
        button.title = "Price: lowest to high"
        button.tintColor = .black0
        button.titleColor = .black0
        button.font = .lightFont(ofSize: 13)
        button.addTarget(self, action: #selector(sortButtonPressed))
        
        return button
    }()
    
    private var groupingButton: Button = {
        let button = Button()
        button.image = UIImage(systemName: "square.grid.2x2.fill")
        button.tintColor = .black0
        button.font = .lightFont(ofSize: 13)
        button.titleColor = .black0
        return button
    }()
    
    weak var delegate: ICollectionReusableViewDelegate?
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .appColor(.viewBackground)
        self.addBottomShadow()
        
        self.setupHierarchy()
        self.setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private
    private func setupHierarchy() {
        self.addSubview(categoriesCollectionView)
        self.addSubview(sortStackView)
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
    }
    
    private func setupUI() {
        
        categoriesCollectionView.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.horizontalEdges.equalToSuperview()
        }
        
        filterButton.snp.makeConstraints { make in
            make.width.equalTo(65)
        }
        
        sortButton.snp.makeConstraints { make in
            make.width.equalTo(150)
        }
        
        groupingButton.snp.makeConstraints { make in
            make.width.equalTo(25)
        }
        
        sortStackView.snp.makeConstraints { make in
            make.top.equalTo(categoriesCollectionView.snp.bottom).offset(18)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(24)
        }
    }
    
    
    //MARK: - Helper func
    @objc
    private func sortButtonPressed() {
        delegate?.sortButtonPressed()
    }
}

//MARK: - UICollectionViewDelegate
extension CatalogCollectionReusableView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.showAnimation {
            // Cell Selected action
        }
    }
}

//MARK: -
extension CatalogCollectionReusableView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100 , height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryBtnCollectionCell.description(), for: indexPath) as! CategoryBtnCollectionCell
        
        cell.configure(title: "T-shirts")
        
        return cell
    }
}
