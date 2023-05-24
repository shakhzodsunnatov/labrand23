//
//  Enums.swift
//  Labrand
//
//  Created by Shakhzod on 24/09/22.
//

import UIKit

enum ViewState: String
{
    case normal, error, ok, grayed
}

enum SortType: String, CaseIterable {
    case popular = "Popular"
    case newest = "Newest"
    case customerReview = "Customer Review"
    case lowestToHigh = "Price: lowest to high"
    case highestToLow = "Price: highest to low"
}

enum ProductCardTableCellType: Int, CaseIterable {
    case scrollImage
    case sizeColor
    
    var tableCellType: UITableViewCell.Type {
        switch self {
        case .scrollImage: return ScrollImageCell.self
        case .sizeColor: return SizeColorTableCell.self
        }
    }
}

