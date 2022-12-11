//
//  
//  CategoriesView.swift
//  Labrand
//
//  Created by Shakhzod on 09/10/22.
//
//

import UIKit
import SnapKit

protocol ICategoriesDelegate: AnyObject {
    func viewAllButtonPressed()
}

class CategoriesView: BaseView {
    
    //MARK: - Properties
    lazy var viewAllButton: BaseButton = {
        let button = BaseButton()
        button.title = "View All Item"
        button.fontSize = 20
        button.addTarget(self, action: #selector(viewAllButtonPressed))
        return button
    }()
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.showsVerticalScrollIndicator = false
        table.contentInsetAdjustmentBehavior = .never
        table.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        table.separatorStyle = .none
        table.backgroundColor = .clear
        table.register(SubcategoryTableCell.self, forCellReuseIdentifier: SubcategoryTableCell.description())
        table.tableHeaderView = HeaderTitleView(frame: CGRect(x: .zero, y: .zero, width: SCREEN_WIDTH, height: 46))
        
        return table
    }()
    
    weak var delegate: ICategoriesDelegate?
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public
    @objc func viewAllButtonPressed() {
        delegate?.viewAllButtonPressed()
    }
}

//MARK: - UI Setup
extension CategoriesView {
    private func setupUI() {
        self.backgroundColor = .appColor(.viewBackground)
        
        self.addSubview(viewAllButton)
        self.addSubview(tableView)
        
        viewAllButton.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.top.left.right.equalTo(self.safeAreaLayoutGuide).inset(16)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(viewAllButton.snp.bottom)
            make.right.left.bottom.equalToSuperview()
        }
    }
}

