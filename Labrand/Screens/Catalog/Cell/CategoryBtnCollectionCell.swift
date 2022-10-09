//
//  CategoryBtnCollectionCell.swift
//  Labrand
//
//  Created by Shakhzod on 09/10/22.
//

import UIKit
import SnapKit

class CategoryBtnCollectionCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    private let title: UILabel = {
        let label = UILabel()
        label.textColor = .white0
        label.font = .mediumFont(ofSize: 16)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.backgroundColor = .black0
        self.contentView.layer.cornerRadius = self.contentView.frame.height/2
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.contentView.addSubview(title)
        
        title.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    //MARK: - Helper func
    func configure(title: String) {
        self.title.text = title
    }
}
