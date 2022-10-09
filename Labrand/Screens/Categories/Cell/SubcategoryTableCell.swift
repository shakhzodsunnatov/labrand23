//
//  SubcategoryTableCell.swift
//  Labrand
//
//  Created by Shakhzod on 09/10/22.
//

import UIKit
import SnapKit

class SubcategoryTableCell: TableViewCell {
    
    var dividerView = UIView()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .lightFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    override func setupUI() {
        addSubviews(titleLabel, dividerView)
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(40)
        }
        
        dividerView.snp.makeConstraints { make in
            make.bottom.right.left.equalToSuperview()
            make.height.equalTo(1)
        }
        
        dividerView.backgroundColor = .gray.withAlphaComponent(0.2)
    }
}
