//
//  UITableViewCell-extension.swift
//  Labrand
//
//  Created by Shakhzod on 22/09/22.
//

import UIKit

extension UITableViewCell
{
    func makeRouned(view: UIView,
                    corners: UIRectCorner,
                    cornerRadius:Double)
    {
        let maskPath = UIBezierPath(roundedRect: self.bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = view.bounds
        shapeLayer.path = maskPath.cgPath
        
        self.layer.mask = shapeLayer
    }
}


extension UITableView {
    func registerCell<Cell: UITableViewCell>(_ cell: Cell.Type) {
        self.register(cell, forCellReuseIdentifier: String(describing: cell))
    }

    func dequeue(_ cell: AnyClass, indexPath: IndexPath) -> UITableViewCell {
        self.dequeueReusableCell(withIdentifier: String(describing: cell), for: indexPath)
    }
    
    func dequeueCell<Cell: UITableViewCell>(_ cell: Cell.Type, indexPath: IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withIdentifier: String(describing: Cell.self), for: indexPath) as? Cell else { return Cell() }
        return cell
    }

    func registerHeaderFooter(_ header: AnyClass) {
        self.register(header, forHeaderFooterViewReuseIdentifier: String(describing: header))
    }

    func dequeueHeaderFooter(_ header: AnyClass) -> UITableViewHeaderFooterView? {
        return self.dequeueReusableHeaderFooterView(withIdentifier: String(describing: header))
    }

}

