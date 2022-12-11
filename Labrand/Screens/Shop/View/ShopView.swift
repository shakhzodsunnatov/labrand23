//
//  
//  ShopView.swift
//  Labrand
//
//  Created by Shakhzod on 04/10/22.
//
//

import UIKit
import SnapKit

class ShopView: BaseView {
    
    //MARK: - Properties
    private lazy var segmentedControl: CustomSegmentedControl = {
        let segment = CustomSegmentedControl()
        segment.setButtonTitles(buttonTitles: ["Women", "Men", "Child"])
        segment.selectorViewColor = .appColor(.redPrimary)
        segment.selectorTextColor = UIColor.black0
        segment.textColor = UIColor.grayBlack0
        segment.backgroundColor = .whiteAssetBg
        segment.delegate = self
        return segment
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 100, right: 0)
        tableView.backgroundColor = .clear
        tableView.register(SaleTabeCell.self, forCellReuseIdentifier: SaleTabeCell.description())
        tableView.register(CategoryTableCell.self, forCellReuseIdentifier: CategoryTableCell.description())
        
        return tableView
    }()
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - SegmentedControlDelegate
extension ShopView: CustomSegmentedControlDelegate {
    func change(to index: Int) {
        
    }
}

//MARK: - UI Setup
extension ShopView {
    private func setupUI() {
        
        self.addSubview(segmentedControl)
        self.addSubview(tableView)
        
        segmentedControl.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).inset(-2)
            make.bottom.right.left.equalToSuperview()
        }
    }
}

