//
//  ProductsSectionHandler.swift
//  Labrand
//
//  Created by Shakhzod on 04/10/22.
//

import UIKit

class ProductsSectionHandler: SectionHandler {
    var products: [ProductModel] = MockData.instance.products
    
    var cellType: UITableViewCell.Type {
        return ProductsTableCell.self
    }
    
    var cellHeight: CGFloat {
        return 378
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellType.description()) as? ProductsTableCell else { return UITableViewCell() }
        
        cell.configure(products: products, cellTitle: "News", subTitle: "Super summer sale")
        
        return cell
    }
}
