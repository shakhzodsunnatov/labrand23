//
//  BaseNavigationController.swift
//  Labrand
//
//  Created by Shakhzod on 22/09/22.
//

import UIKit

class BaseNavigationController: UINavigationController, UIGestureRecognizerDelegate {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Public
    func setTransparentBar() {
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.navigationBar.backgroundColor = .clear
    }
    
    func setColoredBar(color:UIColor) {
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = false
        self.navigationBar.backgroundColor = color
    }
    
    func setTitleText(_ text:String, color: UIColor = UIColor.black0) {
        let textAttributes = [NSAttributedString.Key.foregroundColor:color,
                              NSAttributedString.Key.backgroundColor:UIColor.clear,
                              NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]
        self.navigationBar.titleTextAttributes = textAttributes
        if let vc = self.viewControllers.last {
            vc.title = text
        }
    }
    
    // MARK: - SwipingGestures
    func setupSwipingGestures(isEnabled: Bool = true) {
        navigationItem.hidesBackButton = true
        interactivePopGestureRecognizer?.isEnabled = isEnabled
        interactivePopGestureRecognizer?.delegate = isEnabled ? self : nil
    }
    
    // MARK: - LargeNavigationBarTitles
    func addLargeNavigationBarTitle() {
        self.setNavigationBarHidden(false, animated: false)
        self.navigationBar.prefersLargeTitles = true
        
        if #available(iOS 13.0, *) {
            let scrollAppearance = UINavigationBarAppearance()
            scrollAppearance.configureWithTransparentBackground()
//            scrollAppearance.backgroundColor = ColorCompatibility.viewBackGroundBlackAndWhite
            scrollAppearance.shadowImage = UIImage()
            scrollAppearance.shadowColor = .clear
            
            let appearance = UINavigationBarAppearance()
//            appearance.backgroundColor = ColorCompatibility.viewBackGroundBlackAndWhite
            
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = scrollAppearance
            navigationBar.largeTitleTextAttributes = [
//                NSAttributedString.Key.foregroundColor: ColorCompatibility.normalColor,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]
            navigationBar.titleTextAttributes = [
//                NSAttributedString.Key.foregroundColor: ColorCompatibility.normalColor,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]
        } else {
            // Fallback on earlier versions
        }
    }
    
    func removeLargeNavigationBarTitle() {
        self.navigationBar.prefersLargeTitles = false
    }
    
    func hideNavigationBar(animated: Bool = true) {
        self.setNavigationBarHidden(true, animated: true)
    }
    
    func showNavigationBar(animated: Bool = true) {
        self.setNavigationBarHidden(false, animated: true)
    }
}
