//
//  BannerTableCell.swift
//  Labrand
//
//  Created by Shakhzod on 27/09/22.
//

import UIKit

class BannerTableCell: TableViewCell {

    //MARK: - Properties
    
    //MARK: - SetupUI
    override func setupUI() {
        
    }
    
}

class BannerSectionHandler: SectionHandler {
    
    var cellType: TableViewCell.Type {
        return BannerTableCell.self
    }
    
    var cellHeight: CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellType.description()) as? BannerTableCell else { return UITableViewCell() }
        return cell
    }
}
