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
    
    //MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Setup Cell
        selectionStyle = .none
        backgroundColor = .clear
        
        // Setup Custom Views
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Publice
    func setupUI() {}
}
