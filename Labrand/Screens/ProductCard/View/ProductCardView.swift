//
//  
//  ProductCardView.swift
//  Labrand
//
//  Created by Shakhzod on 10/10/22.
//
//

import UIKit
import Cosmos

class ProductCardView: UIView {
    
    //MARK: - Properties
    var tableView: UITableView!
    
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
extension ProductCardView {
    private func setupUI() {
        self.backgroundColor = .appColor(.viewBackground)
        tableView = createTableView()
    }
}

//MARK: - UI Create

extension ProductCardView {
    
    private func createTableView() -> UITableView {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.separatorStyle = .none
        tableView.registerCell(ScrollImageCell.self)
        
        self.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
        }
        
        return tableView
    }
}
