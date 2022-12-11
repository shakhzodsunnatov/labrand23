//
//  BannerTableCell.swift
//  Labrand
//
//  Created by Shakhzod on 27/09/22.
//

import UIKit
import SnapKit

class ProductsTableCell: UITableViewCell {
    
    //MARK: - Properties
    
    var productsModel: [ProductModel] = []
    var completionShowAllButton: ()-> Void = {}
    var completionDidSelectItemAt: (ProductModel?) -> Void = { _ in }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.dataSource = self
        collection.delegate = self
        collection.register(ProductCollectionItemCell.self, forCellWithReuseIdentifier: ProductCollectionItemCell.description())
        collection.showsHorizontalScrollIndicator = false
        
        return collection
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSMutableAttributedString.createAttrString(
            text: "News",
            font: .boldFont(ofSize: 34),
            lineSpacing: 1.08,
            value: 0.34,
            textAligment: .left,
            lineBreakMode: .byTruncatingTail,
            color: .black0)
        
        return label
    }()
    private let subTitle: UILabel = {
        let label = UILabel()
        label.attributedText = NSMutableAttributedString.createAttrString(
            text: "Super summer sale",
            font: .regularFont(ofSize: 13),
            lineSpacing: 1.08,
            value: 0.34,
            textAligment: .left,
            lineBreakMode: .byTruncatingTail,
            color: .gray)
        
        return label
    }()
    private lazy var showAllButton: Button = {
        let button = Button()
        button.titleColor = .black0
        button.font = .regularFont(ofSize: 13)
        button.title = "View all"
        button.contentHorizontalAlignment = .right
        button.addTarget(self, action: #selector(showAllButtonPressed))
        
        return button
    }()
    
        //MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        self.setupHierarchy()
        self.setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    //MARK: - Helper functions
    func configure(products: [ProductModel]?, cellTitle: String, subTitle: String) {
        guard let products else { return }
        
        self.productsModel = products
        self.updateTextLabels(title: cellTitle, subTitle: "You’ve never seen it before!")
        self.collectionView.reloadData()
    }
    
    @objc private func showAllButtonPressed() {
        self.completionShowAllButton()
    }
}

//MARK: - Private
extension ProductsTableCell {
    
    private func setupHierarchy() {
        self.contentView.addSubviews(titleLabel, subTitle)
        self.contentView.addSubview(showAllButton)
        self.contentView.addSubview(collectionView)
    }
    
    private func setupUI() {
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(35)
            make.left.equalTo(16)
            let width = self.contentView.frame.size.width - 16 - 66
            make.width.equalTo(width)
        }
        
        subTitle.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.left.equalTo(16)
            let width = self.contentView.frame.size.width - 16 - 66
            make.width.equalTo(width)
        }
        
        showAllButton.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel).offset(5)
            make.right.equalTo(-16)
            make.height.equalTo(20)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(subTitle.snp.bottom).offset(20)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    private func updateTextLabels(title: String, subTitle: String) {
        
        self.titleLabel.attributedText = NSMutableAttributedString.createAttrString(
            text: title,
            font: .boldFont(ofSize: 34),
            lineSpacing: 1.08,
            value: 0.34,
            textAligment: .left,
            lineBreakMode: .byTruncatingTail,
            color: .black0)
        
        self.subTitle.attributedText = NSMutableAttributedString.createAttrString(
            text: title,
            font: .regularFont(ofSize: 13),
            lineSpacing: 1.08,
            value: 0.34,
            textAligment: .left,
            lineBreakMode: .byTruncatingTail,
            color: .gray)
    }
}

//MARK: - UICollectionViewDelegate
extension ProductsTableCell {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        completionDidSelectItemAt(productsModel[indexPath.row])
    }
}

//MARK: - UICollectionViewDataSource & UICollectionViewDelegateFlowLayout
extension ProductsTableCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionItemCell.description(), for: indexPath) as! ProductCollectionItemCell
        
        cell.configureBy(model: productsModel[indexPath.row])
        
        return cell
    }
    
    func collectionView( _ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath ) -> CGSize {
        return CGSize(width: 165, height: 260)
    }
}

