//
//  TabBarItem.swift
//  Labrand
//
//  Created by Shakhzod on 04/10/22.
//

import UIKit

enum TabBarItemType: Int {
    case unknown         = -1
    case home           = 0
    case shop           = 1
    case bag            = 2
    case favorites      = 3
    case profile        = 4
}

class TabBarItem: UITabBarItem {
    var tabItemType: TabBarItemType = .unknown
}

