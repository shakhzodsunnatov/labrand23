//
//  UIFont+Additions.swift
//  LaModa
//
//  Created by Shokhzod on 16/03/22.
//

import UIKit

public enum FontName: String {
    case bold = "Metropolis-Bold"
    case medium = "Metropolis-Medium"
    case regular = "Metropolis-Regular"
    case semiBold = "Metropolis-SemiBold"
    case thin = "Metropolis-Thin"
    case light = "Metropolis-Light"
    case black = "Metropolis-Black"
}

extension UIFont {
    private convenience init?(font: FontName, size: CGFloat = 15) {
        self.init(name: font.rawValue, size: size)
    }
    
    class func lightFont(ofSize size: CGFloat = 15) -> UIFont {
        return UIFont(font: .light, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    class func regularFont(ofSize size: CGFloat = 15) -> UIFont {
        return UIFont(font: .regular, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    class func mediumFont(ofSize size: CGFloat = 15) -> UIFont {
        return UIFont(font: .medium, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    class func semiBoldFont(ofSize size: CGFloat = 15) -> UIFont {
        return UIFont(font: .semiBold, size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    
    class func boldFont(ofSize size: CGFloat = 15) -> UIFont {
        return UIFont(font: .bold, size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    
    class func blackFont(ofSize size: CGFloat = 15) -> UIFont {
        return UIFont(font: .black, size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    
    class func thinFont(ofSize size: CGFloat = 15) -> UIFont {
        return UIFont(font: .thin, size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    
    class func printFont() {
        for fontFamilyName in UIFont.familyNames {
            print("Family name: \(fontFamilyName)")
            
            for fontName in UIFont.fontNames(forFamilyName: fontFamilyName) {
                print("--Font name: \(fontName)")
            }
        }
    }
}
