//
//  UIColor.swift
//  Labrand
//
//  Created by Shakhzod on 22/09/22.
//

import UIKit

extension UIColor {
    static func appColor(_ name: AssetColors) -> UIColor {
        return UIColor(named: name.rawValue) ?? .clear
    }
    
    convenience init(red: UInt64, green: UInt64, blue: UInt64, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: alpha)
    }
}
