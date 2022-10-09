//
//  SortSheetViewController.swift
//  Labrand
//
//  Created by Shakhzod on 09/10/22.
//

import UIKit
import SnapKit

class SortSheetViewController: UIViewController {

    //MARK: - Properties
    let callbackClouser: (SortType) -> Void = {_ in}
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.showsVerticalScrollIndicator = false
        table.contentInsetAdjustmentBehavior = .never
        table.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 100, right: 0)
        table.separatorStyle = .none
        table.isScrollEnabled = false
        table.delegate = self
        table.dataSource = self
        
        return table
    }()
    private let sheetContrinerView: UIView = {
        let view = UIView()
        view.backgroundColor = .appColor(.viewBackground)
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(sheetContrinerView)
        sheetContrinerView.addSubview(tableView)
        
        sheetContrinerView.snp.makeConstraints { make in
            make.height.equalTo(350)
            make.horizontalEdges.bottom.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
        view.addTargetToView(target: self, selector: #selector(self.disMiss))
    }
    
    @objc func disMiss() {
        self.dismiss(animated: true)
    }
}

//MARK: - UITableViewDelegate & UITableViewDatasource
extension SortSheetViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        callbackClouser(SortType.allCases[indexPath.row])
        self.dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SortType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        
        let divView = UIView()
        divView.backgroundColor = .systemGray
        
        headerView.addSubview(divView)
        divView.snp.makeConstraints { make in
            make.height.equalTo(6)
            make.width.equalTo(60)
            make.centerX.equalToSuperview().offset(16)
        }
        divView.layer.cornerRadius = 3
        
        let title = UILabel()
        title.text = "Sort by"
        title.font = .semiBoldFont(ofSize: 20)
        title.textAlignment = .center
        
        headerView.addSubview(title)
        title.snp.makeConstraints { make in
            make.top.equalTo(divView.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().offset(16)
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = SortType.allCases[indexPath.row].rawValue
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = .appColor(.redPrimary)
        cell.selectedBackgroundView = bgColorView
        
        cell.textLabel?.highlightedTextColor = .heartBg
        
        return cell
    }
}
