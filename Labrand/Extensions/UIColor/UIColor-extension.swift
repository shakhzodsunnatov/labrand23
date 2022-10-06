//
//  UIColor-extension.swift
//  Labrand
//
//  Created by Shakhzod on 22/09/22.
//

import UIKit

//MARK: - init(hexString: "#fffff")

extension UIColor {
    convenience init(hexString: String,
                     alpha: CGFloat = 1.0)
    {
        // this code got from internet:
        // =====================================
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
        // =====================================
    }
    
    convenience init(
        light lightModeColor: @escaping @autoclosure () -> UIColor,
        dark darkModeColor: @escaping @autoclosure () -> UIColor
    ) {
        self.init { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .light:
                return lightModeColor()
            case .dark:
                return darkModeColor()
            case .unspecified:
                return lightModeColor()
            @unknown default:
                return lightModeColor()
            }
            
        }
    }
}


//MARK: - Random Color

extension UIColor {
    class func randomColor() -> UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(256)),
                       g: CGFloat(arc4random_uniform(256)),
                       b: CGFloat(arc4random_uniform(256)))
    }
}


//MARK: QinPageView

extension UIColor {
    convenience init(r : CGFloat, g : CGFloat, b : CGFloat, alpha : CGFloat = 1.0) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
}

//MARK: - Colors
extension UIColor {
    // 0 -> changeable Color
    class var black0: UIColor {
        UIColor(
            light: UIColor.black,
            dark: UIColor.white
        )
    }
    
    class var whiteAssetBg: UIColor {
        UIColor(
            light: .white,
            dark: .appColor(.viewBackground))
    }
    
    class var grayBlack0: UIColor {
        UIColor(
            light: .black,
            dark: .gray
        )
    }
    
    class var shadowColor: UIColor {
        UIColor(
            light: UIColor.gray,
            dark: UIColor.black
        )
    }
    
    class var heartBg: UIColor {
        UIColor(
            light: .white,
            dark: UIColor(hexString: "#2A2C36"))
    }
}
