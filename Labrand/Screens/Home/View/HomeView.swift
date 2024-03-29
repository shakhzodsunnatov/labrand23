//
//  HomeView.swift
//  Labrand
//
//  Created by Shakhzod on 27/09/22.
//

import UIKit
import SnapKit

class HomeView: BaseView {
    
    //MARK: - Properties
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        tableView.tableHeaderView = headerBannerView
        tableView.registerCell(ProductsTableCell.self)
        
        return tableView
    }()
    let headerBannerView = BannerHeaderView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 500))
    
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
extension HomeView {
    private func setupUI() {
    
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

