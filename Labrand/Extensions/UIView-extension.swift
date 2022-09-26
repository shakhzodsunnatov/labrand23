//
//  UIView-extension.swift
//  Labrand
//
//  Created by Shakhzod on 22/09/22.
//

import UIKit

extension UIView
{
    
    func bordered(lineWidth: CGFloat, strokeColor: UIColor = UIColor.gray)
    {
        let path = UIBezierPath.init(roundedRect: self.bounds,
                                     cornerRadius: self.frame.width/2)
        
        let borderLayer = CAShapeLayer()
        
        borderLayer.lineWidth = lineWidth
        borderLayer.strokeColor = strokeColor.cgColor
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.frame = self.bounds
        borderLayer.path = path.cgPath
        
        self.layer.addSublayer(borderLayer)
    }
    
    
    
    func rounded(insets: UIEdgeInsets = .zero)
    {
        let path = UIBezierPath.init(roundedRect: self.bounds.inset(by: insets),
                                     cornerRadius: self.frame.width/2)
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = path.cgPath
        
        self.layer.mask = maskLayer
    }
    
    
    func makeViewRouned(view: UIView,
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
    
    
    func addTargetToView(target: Any, selector: Selector) {
        let tap = UITapGestureRecognizer(target: target, action: selector)
        isUserInteractionEnabled = true
        addGestureRecognizer(tap)
    }
}
