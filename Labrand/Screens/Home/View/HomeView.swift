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
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .none
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        tableView.backgroundColor = .clear
        
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

//MARK: - UI Setup
extension HomeView {
    private func setupUI() {
        self.backgroundColor = .appColor(.viewBackground)
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func registerCellToTableView(sectionContainer: SectionContainer) {
        sectionContainer.sectionHandlers.forEach { cell in
            tableView.register(cell.cellType, forCellReuseIdentifier: cell.cellType.description())
        }
    }
}
