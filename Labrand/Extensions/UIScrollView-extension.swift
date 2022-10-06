//
//  UIScrollView-extension.swift
//  Labrand
//
//  Created by Shakhzod on 06/10/22.
//

import UIKit

extension UIScrollView {
    func scrollTo(horizontalPage: Int? = 0, verticalPage: Int? = 0, animated: Bool? = true) {
        var frame: CGRect = self.frame
        frame.origin.x = frame.size.width * CGFloat(horizontalPage ?? 0)
        frame.origin.y = frame.size.width * CGFloat (verticalPage ?? 0)
        self.scrollRectToVisible(frame, animated: animated ?? true)
    }
}
