//
//  CategoryTableCell.swift
//  Labrand
//
//  Created by Shakhzod on 05/10/22.
//

import UIKit
import SnapKit

class CategoryTableCell: TableViewCell {

    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .appColor(.darkBlueWhite)
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.layer.masksToBounds = false // need for shadow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var title: UILabel = {
        let label = UILabel()
        label.font = .semiBoldFont(ofSize: 22)
        label.text = "Clothes"
        return label
    }()
    
    var clothesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cat0")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        return imageView
    }()
    
    override func setupUI() {
        super.setupUI()
        
        addSubview(containerView)
        containerView.addSubviews(title, clothesImageView)
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16))
        }
        
        title.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(23)
            make.right.equalTo(clothesImageView.snp.left).offset(-10)
            make.centerY.equalToSuperview()
        }
        
        clothesImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.right.equalToSuperview().offset(2)
            make.width.equalTo((containerView.frame.size.width/2)-32)
        }
        
        containerView.layer.shadowColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowRadius = 7
        containerView.layer.shadowOffset = CGSize(width: 0, height: 3)
    }
    
    //MARK: - Helper
    func configure(index: Int) {
        let index = index - 1
        let model = MockData.instance.shopCategories[index]
        self.title.text = model.name ?? "No Name"
        self.clothesImageView.image = model.image!
    }
}
