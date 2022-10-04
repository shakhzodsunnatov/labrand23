//
//  TabBarBadge.swift
//  Labrand
//
//  Created by Shakhzod on 04/10/22.
//

import UIKit

class TabBarBadge: UILabel {
    var identifier: String = String(describing: TabBarBadge.self)
    
    private func identifier(for index: Int) -> String {
        return "\(String(describing: TabBarBadge.self))-\(index)"
    }
    
    convenience init(for index: Int) {
        self.init()
        identifier = identifier(for: index)
    }
    
    func hasIdentifier(for index: Int) -> Bool {
        let has = identifier == identifier(for: index)
        return has
    }
}

class TabBarBadgeConfiguration {
    var backgroundColor: UIColor = .clear
    var centerOffset: CGPoint = .init(x: 6, y: IS_IPHONE_X_AND_UPPER ? -30 : -15)
    var size: CGSize = .init(width: 17, height: 17)
    var textColor: UIColor = .red
    var font: UIFont! = .systemFont(ofSize: 11) {
        didSet { font = font ?? .systemFont(ofSize: 11) }
    }
    
    static func construct(_ block: (TabBarBadgeConfiguration) -> Void) -> TabBarBadgeConfiguration {
        let new = TabBarBadgeConfiguration()
        block(new)
        return new
    }
}

extension UITabBar {
    func setBadge(value: String?, at index: Int, withConfiguration configuration: TabBarBadgeConfiguration = TabBarBadgeConfiguration()) {
        let existingBadge = subviews.first { ($0 as? TabBarBadge)?.hasIdentifier(for: index) == true }
        existingBadge?.removeFromSuperview()
        
        UserDefaults.standard.setValue((value==nil) ? false : true, forKey: "hasOrder")
        
        guard let tabBarItems = items,
              let value = value else { return }
        
        let itemPosition = CGFloat(index + 1)
        let itemWidth = frame.width / CGFloat(tabBarItems.count)
        let itemHeight = frame.height
        
        let badge = TabBarBadge(for: index)
        badge.frame.size = configuration.size
        badge.center = CGPoint(x: (itemWidth * itemPosition) - (0.5 * itemWidth) + configuration.centerOffset.x,
                               y: (0.5 * itemHeight) + configuration.centerOffset.y)
        badge.layer.cornerRadius = 0.5 * configuration.size.height
        badge.clipsToBounds = true
        badge.textAlignment = .center
        badge.backgroundColor = configuration.backgroundColor
        badge.font = configuration.font
        badge.textColor = configuration.textColor
        badge.text = value
        
        addSubview(badge)
    }
}

