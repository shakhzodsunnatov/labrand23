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
    
    var completionShowAllButton: ()-> Void = {}
    var complationDidSelectItemAt: (ProductModel?) -> Void = { _ in }
    
    var collectionView: UICollectionView!
    var productsModel: [ProductModel] = []
    var titleLabel: UILabel!
    var subTitle: UILabel!
    var allButton: UIButton!
    
    //MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = .clear
        
//        self.titleLabel =
//        self.allButton =
//        self.collectionView =
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helper functions
    
    @objc private func showAllButtonPressed() {
        self.completionShowAllButton()
    }
    
    private func updateTextLabels(title: String, subTitle: String) {
        self.allButton.setTitle("View all", for: .normal)
        
        self.titleLabel.attributedText = NSMutableAttributedString.creatAttrString(
            text: title,
            font: .boldFont(ofSize: 34),
            lineSpacing: 1.08,
            value: 0.34,
            textAligment: .left,
            lineBreakMode: .byTruncatingTail,
            color: .black)
        
        self.subTitle.attributedText = NSMutableAttributedString.creatAttrString(
            text: title,
            font: .regularFont(ofSize: 13),
            lineSpacing: 1.08,
            value: 0.34,
            textAligment: .left,
            lineBreakMode: .byTruncatingTail,
            color: .black)
    }
    
    private func setUpInit(products: [ProductModel]?, cellTitle: String) {
        if let products {
            self.productsModel = products
            self.collectionView.reloadData()
        }
        
        self.updateTextLabels(title: cellTitle, subTitle: "You’ve never seen it before!")
    }
    
    private func createCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 0,
                                           left: 14,
                                           bottom: 0,
                                           right: 16)
        
        layout.estimatedItemSize = CGSize(width: 150, height: 260)
        
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        
        let collection = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        collection.dataSource = self
        collection.delegate = self
        collection.register(ShopCollectionItemCell.self,
                            forCellWithReuseIdentifier: ShopCollectionItemCell.cellIdentifier)
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = UIColor.clear
        
        self.contentView.addSubview(collection)
        

        collection.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(16)
            make.left.bottom.right.equalToSuperview()
        }
        
        return collection
    }
}

//MARK: - SetupUI

extension ProductsTableCell {
    
    
    
    
    
}



//MARK: - ProductsSectionHandler
class ProductsSectionHandler: SectionHandler {
    
    var cellType: UITableViewCell.Type {
        return ProductsTableCell.self
    }
    
    var cellHeight: CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellType.description()) as? ProductsTableCell else { return UITableViewCell() }
        return cell
    }
}
