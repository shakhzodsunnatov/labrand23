//
//  Button.swift
//  Labrand
//
//  Created by Shakhzod on 23/09/22.
//

import UIKit

class Button: UIButton {
    var backgroundColorHighlighted: UIColor?
    var backgroundColorDisabled: UIColor?
    var backgroundColorSelected: UIColor?
    
    var titleColorSelected: UIColor? {
        didSet {
            self.setTitleColor(titleColorSelected, for: .selected)
        }
    }
    
    var widthAdditional: CGFloat = 0
    var heightAdditional: CGFloat = 0
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
//        setup()
    }
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
//        setup()
    }
    
    init(title: String = "", color: UIColor? = nil, borderColor: UIColor? = nil) {
        self.init()
        
        defer {
            self.title = title
            self.color = color
            self.borderColor = borderColor
        }
    }
    
    private func setup() {
        self.backgroundColor = UIColor.clear
        
        self.font = UIFont.systemFont(ofSize: 15)
        self.titleColor = UIColor.white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2
    }
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? backgroundColorSelected : color
            
            self.isUserInteractionEnabled = !isSelected
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            if (color == nil && borderColor == nil) {
                self.imageView?.alpha = isHighlighted ? 0.5 : 1
            } else {
                if (isSelected == false) {
                    backgroundColor = isHighlighted ? backgroundColorHighlighted : color
                }
            }
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            backgroundColor = isEnabled ? color : backgroundColorDisabled
        }
    }
    
    var titleColor: UIColor! {
        didSet {
            self.setTitleColor(titleColor, for: .normal)
            if (titleColor != nil) {
                self.setTitleColor(titleColor.withAlphaComponent(0.5), for: .highlighted)
            }
            self.setTitleColor(UIColor.black0, for: .disabled)
        }
    }
    
    var color: UIColor? {
        didSet {
            if (color != nil) {
                self.backgroundColor = color
                self.titleColor = UIColor.white
                
                backgroundColorHighlighted = color?.withAlphaComponent(0.5)
                backgroundColorDisabled = UIColor(red: 224, green: 224, blue: 224)
                
                backgroundColorSelected = .appColor(.redPrimary)
            }
        }
    }
    
    var borderColor: UIColor? {
        didSet {
            if (borderColor != nil) {
                self.titleColor = borderColor
                
                backgroundColorHighlighted = (color != nil ? color : borderColor)?.withAlphaComponent(0.5)
                
                self.layer.borderWidth = 1.0
                self.layer.borderColor = borderColor?.cgColor
            }
        }
    }
    
    var fontSize: CGFloat = 15 {
        didSet {
            self.font = UIFont.systemFont(ofSize: fontSize)
        }
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeOld = super.sizeThatFits(size)
        
        if (widthAdditional > 0 || heightAdditional > 0) {
            sizeOld.width += widthAdditional*2
            sizeOld.height += heightAdditional*2
        } else if (image != nil) {
            sizeOld.width += 10
        } else if (sizeOld.width < titleWidth + 20) {
            sizeOld.width += 20
        }
        
        return sizeOld
    }
    
    enum ImagePosition {
        case left
        case right
    }
    
    var imagePosition = ImagePosition.left
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        var rect = super.imageRect(forContentRect: contentRect)
        
        if (self.contentHorizontalAlignment == .center) {
            if (imagePosition == .right) {
                rect.origin.x = contentRect.width - rect.width - padding
            } else {
                if (image != nil && !title.isEmpty) {
                    rect.origin.x -= 5
                    
                    if (imageWidthDelta > 0) {
                        rect.size.width -= imageWidthDelta
                        rect.origin.x += imageWidthDelta/2 + 5
                    }
                    
                    if (imageHeightDelta > 0) {
                        rect.size.height -= imageHeightDelta
                        rect.origin.y += imageHeightDelta/2
                    }
                }
            }
        }
        
        return rect
    }
    
    var titleWidth: CGFloat = 0
    
    var imageHeightDelta: CGFloat = 0
    var imageWidthDelta: CGFloat = 0
    
    var padding: CGFloat = 0
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        var rect = super.titleRect(forContentRect: contentRect)
        
        if (imagePosition == .right) {
            rect.origin.x = padding
        } else {
            if (image != nil) {
                rect.origin.x += 5
            }
        }
        
        titleWidth = rect.size.width
        
        return rect
    }
}

