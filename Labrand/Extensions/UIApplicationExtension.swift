//
//  UIApplicationExtension.swift
//  Labrand
//
//  Created by Shakhzod on 22/09/22.
//

import UIKit

extension UIApplication {
    
    class func getTopViewController(base: UIViewController? = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController) -> UIViewController? {
        
        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)
            
        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)
            
        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
    
    class func getTopNavigationController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UINavigationController? {
        
        if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            
            if let nav = selected as? UINavigationController {
                return nav
            }
        }
        
        return nil
    }
}

