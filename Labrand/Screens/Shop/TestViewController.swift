//
//  TestViewController.swift
//  Labrand
//
//  Created by Shakhzod on 06/10/22.
//

import UIKit
import SnapKit

class TestViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 100, right: 0)
        tableView.backgroundColor = .clear
        tableView.register(SaleTabeCell.self, forCellReuseIdentifier: SaleTabeCell.description())
        tableView.register(CategoryTableCell.self, forCellReuseIdentifier: CategoryTableCell.description())
        
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: SaleTabeCell.description(), for: indexPath) as! SaleTabeCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableCell.description(), for: indexPath) as! CategoryTableCell
            cell.configure(index: indexPath.row)
            return cell
        }
    }
}
