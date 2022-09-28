//
//  SectionHandler.swift
//  Labrand
//
//  Created by Shakhzod on 27/09/22.
//

import UIKit
/// Using for tableView, when there are many type of cell
///
/// With this protocol we observe OpenClose principle rule
///
protocol SectionHandler {
    var cellType: TableViewCell.Type { get }
    var cellHeight: CGFloat { get }
    func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
}

