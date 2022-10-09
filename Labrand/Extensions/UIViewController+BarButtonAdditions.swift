//
//  UIViewController+BarButtonAdditions.swift
//  Labrand
//
//  Created by Shakhzod on 04/10/22.
//

import UIKit

extension UIViewController {
    func addBackButton() {
        addLeftButton()
    }
    
    func addLeftButton(imagename: String, selector: Selector? = nil) {
        addLeftButton(image: UIImage(named: imagename), selector: selector)
    }
    
    func addLeftButton(image: UIImage? = nil, selector: Selector? = nil) {
        var imageBack = image
        if (image == nil) {
            let image = UIImage(systemName: "chevron.left")
            imageBack = image?.withTintColor(.black0, renderingMode: .alwaysOriginal)
        }
        
        var selectorBack = selector
        if (selector == nil) {
            selectorBack = #selector(goBack)
        }
        
        let barButton = createBarButton(image: imageBack!, selector: selectorBack!)
        self.navigationItem.leftBarButtonItem = barButton
    }
    
    func addLeftButtons(images:[UIImage], selectors: [Selector]) {
        let barButtons = createBarButtons(images: images, selectors: selectors)
        
        self.navigationItem.leftBarButtonItems = barButtons
    }
    
    func addLeftButtons(imagenames:[String], selectors: [Selector]) {
        let barButtons = createBarButtons(imagenames: imagenames, selectors: selectors)
        
        self.navigationItem.leftBarButtonItems = barButtons
    }
    
    func navigationTraditionalTopBar() {
        self.addBackButton()
        self.addRightButton(image: UIImage(systemName: "magnifyingglass")!.withTintColor(.black0, renderingMode: .alwaysOriginal), selector: #selector(searchButtonTapped))
        self.navigationController?.makeNavigationBarTransparent()
        
    }
    
    func addLeftSearchButton() {
        self.addRightButton(image: UIImage(systemName: "magnifyingglass")!.withTintColor(.black0, renderingMode: .alwaysOriginal), selector: #selector(searchButtonTapped))
    }
    
    func addRightButton(imagename: String, selector: Selector) {
        guard let image = UIImage(named: imagename) else { return }
        
        addRightButton(image: image, selector: selector)
    }
    
    func addRightButton(image: UIImage, selector: Selector) {
        let barButton = createBarButton(image: image, selector: selector)
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    func addRightButtons(images:[UIImage], selectors: [Selector]) {
        let barButtons = createBarButtons(images: images, selectors: selectors)
        
        self.navigationItem.rightBarButtonItems = barButtons
    }
    
    func addRightButtons(imagenames:[String], selectors: [Selector]) {
        let barButtons = createBarButtons(imagenames: imagenames, selectors: selectors)
        
        self.navigationItem.rightBarButtonItems = barButtons
    }
    
    func createBarButton(image: UIImage, selector: Selector) -> UIBarButtonItem {
        let barButton = UIBarButtonItem(image: image.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: selector)
        
        return barButton
    }
    
    func createBarButton(imagename: String, selector: Selector) -> UIBarButtonItem {
        let barButton = UIBarButtonItem(image: UIImage(named: imagename)?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: selector)
        
        return barButton
    }
    
    private func createBarButtons(images:[UIImage], selectors: [Selector]) -> [UIBarButtonItem] {
        var barButtons = [UIBarButtonItem]()
        
        for index in 0..<images.count {
            barButtons.append(createBarButton(image: images[index], selector: selectors[index]))
        }
        
        return barButtons
    }
    
    private func createBarButtons(imagenames:[String], selectors: [Selector]) -> [UIBarButtonItem] {
        var barButtons = [UIBarButtonItem]()
        
        for index in 0..<imagenames.count {
            barButtons.append(createBarButton(imagename: imagenames[index], selector: selectors[index]))
        }
        
        return barButtons
    }
    
    func createBarButton(title: String = "", font: UIFont = UIFont.semiBoldFont(ofSize: 16), color: UIColor = UIColor.white, selector: Selector? = nil) -> UIBarButtonItem {
        let barButton = UIBarButtonItem(title: title, style: .done, target: self, action: selector)
        
        let textAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font : font, NSAttributedString.Key.foregroundColor : color]
        barButton.setTitleTextAttributes(textAttributes, for: .disabled)
        barButton.setTitleTextAttributes([NSAttributedString.Key.font : font], for: .highlighted)
        barButton.setTitleTextAttributes(textAttributes, for: .normal)
        barButton.setTitleTextAttributes(textAttributes, for: .selected)
        
        return barButton
    }
    
    func createBackButton(withSelector selector: Selector = #selector(goBack), color: UIColor = UIColor.black) -> UIBarButtonItem {
        let imageBack = UIImage(systemName: "chevron.left")!.withTintColor(color, renderingMode: .alwaysOriginal)
        
        let backButton = createBarButton(image: imageBack, selector: selector)
        
        return backButton
    }
    
    @objc func addBackButton(withTitle title: String, font: UIFont = UIFont.semiBoldFont(ofSize: 16), color: UIColor = UIColor.white, selector: Selector = #selector(goBack)) {
        let backButton = createBackButton(withSelector: selector, color: color)
        let titleButton = createBarButton(title: title, font: font, color: color, selector: selector)
//        titleButton.isEnabled = false
        self.navigationItem.leftBarButtonItems = [backButton, titleButton]
    }
}
