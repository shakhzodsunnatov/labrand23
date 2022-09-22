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
}
