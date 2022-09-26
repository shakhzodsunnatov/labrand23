//
//  TabBarController-extension.swift
//  Labrand
//
//  Created by Shakhzod on 22/09/22.
//

import UIKit

extension UITabBarController
{
    func tabsVisiblty(_ isVisiblty: Bool = true)
    {
        if isVisiblty
        {
            tabBar.isHidden = false
            tabBar.layer.zPosition = 0
        }
        else
        {
            tabBar.isHidden = true
            tabBar.layer.zPosition = -1
        }
    }
}

extension UITabBarItem {
    func setTabBarItemBagde(value: Bool) {
        badgeValue = value ? "●" : nil
        badgeColor = .clear
        setBadgeTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .normal)
    }
}
