//
//  PaddingLabel.swift
//  Labrand
//
//  Created by Shakhzod on 04/10/22.
//

import UIKit

class PaddingLabel: UILabel {

    var topInset: CGFloat = 6
    var bottomInset: CGFloat = 6
    var leftInset: CGFloat = 5
    var rightInset: CGFloat = 5
    
    var labelBackground : UIColor = .red

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }

    override var bounds: CGRect {
        didSet {
            // ensures this works within stack views if multi-line
            preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = labelBackground
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
    }
}

