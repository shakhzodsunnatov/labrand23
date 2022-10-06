//
//  SaleTabeCell.swift
//  Labrand
//
//  Created by Shakhzod on 05/10/22.
//

import UIKit

class SaleTabeCell: TableViewCell {
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .appColor(.saleRed)
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var labelStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [title, subTitle])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .center
        
        return stack
    }()
    
    var title: UILabel = {
        let label = UILabel()
        label.font = .semiBoldFont(ofSize: 29)
        label.textColor = .white
        label.text = "SUMMER SALES"
        return label
    }()
    
    var subTitle: UILabel = {
        let label = UILabel()
        label.font = .thinFont(ofSize: 20)
        label.textColor = .white
        label.text = "Up to 50% off"
        return label
    }()
    
    override func setupUI() {
        super.setupUI()
        
        addSubview(mainView)
        mainView.addSubviews(labelStack)
        
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16))
        }
        labelStack.snp.makeConstraints { make in
            make.center.width.equalToSuperview()
        }
    }
}
