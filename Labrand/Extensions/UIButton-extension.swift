//
//  UIButton-extension.swift
//  Labrand
//
//  Created by Shakhzod on 23/09/22.
//

import UIKit

extension UIButton {
    private struct AssociatedKeys {
        static var title = "title"
        static var font = "font"
        static var imageName = "imageName"
        static var image = "image"
    }

    var title: String! {
        get {
            guard let title = objc_getAssociatedObject(self, &AssociatedKeys.title) as? String else {
                return ""
            }

            return title
        }

        set(value) {
            objc_setAssociatedObject(self, &AssociatedKeys.title, value, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            self.setTitle(value, for: .normal)
        }
    }
    
    var font: UIFont! {
        get {
            guard let font = objc_getAssociatedObject(self, &AssociatedKeys.font) as? UIFont else {
                return UIFont.systemFont(ofSize: 15, weight: .thin)
            }

            return font
        }

        set(value) {
            objc_setAssociatedObject(self, &AssociatedKeys.font, value, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            self.titleLabel?.font = value
        }
    }
    
    var image: UIImage? {
        get {
            guard let image = objc_getAssociatedObject(self, &AssociatedKeys.image) as? UIImage else {
                return nil
            }

            return image
        }

        set(value) {
            objc_setAssociatedObject(self, &AssociatedKeys.image, value, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            self.setImage(value, for: .normal)
        }
    }
    
    var imageName: String! {
        get {
            guard let imageName = objc_getAssociatedObject(self, &AssociatedKeys.imageName) as? String else {
                return ""
            }

            return imageName
        }

        set(value) {
            objc_setAssociatedObject(self, &AssociatedKeys.imageName, value, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)

            self.image = UIImage(named: value)
        }
    }
    
    func addTarget(_ target: Any?, action: Selector) {
        self.addTarget(target, action: action, for: .touchUpInside)
    }
}

//MARK: - Button with arrow right " some text ->"
extension Button {
    class func createButtonWithRightArrow(withTitle title: String) -> Button {
        let button = Button(title: title.uppercased())
        
        button.titleColor = UIColor.white
        button.font = UIFont.systemFont(ofSize: 15)
        button.imageName = "redArrowRight"
        button.imagePosition = .right
        
        return button
    }
}
