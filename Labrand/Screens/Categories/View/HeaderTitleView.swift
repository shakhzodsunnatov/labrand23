//
//  HeaderTitleView.swift
//  Labrand
//
//  Created by Shakhzod on 09/10/22.
//

import UIKit
import SnapKit

class HeaderTitleView: UIView {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Choose category"
        label.font = .lightFont(ofSize: 14)
        label.textColor = .gray
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.left.equalToSuperview().inset(16)
        }
    }
    
}
