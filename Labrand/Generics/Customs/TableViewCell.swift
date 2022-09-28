//
//  TableViewCell.swift
//  Labrand
//
//  Created by Shakhzod on 27/09/22.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    
    //MARK: - Properties
    var containerView = UIView()
    
    //MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Setup Cell
        selectionStyle = .none
        backgroundColor = .clear
        
        // Setup containerView
        contentView.addSubview(containerView)
        
        // Setup Custom Views
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    //MARK: - Publice
    func setupUI() {}
    
}
