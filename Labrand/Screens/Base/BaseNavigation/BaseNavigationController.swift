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
    
    func setTitleText(_ text:String, color: UIColor = UIColor.black) {
        let textAttributes = [NSAttributedString.Key.foregroundColor: color,
                              NSAttributedString.Key.backgroundColor:UIColor.clear,
                              NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24)]
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

//MARK: - Helpers
extension UINavigationController {
    func makeNavigationBarTransparent() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.shadowColor = .clear
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black0]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black0]
        navBarAppearance.backgroundColor = .appColor(.viewBackground)
        
        self.navigationBar.standardAppearance = navBarAppearance
        self.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        self.navigationBar.layer.shadowColor = UIColor.black.cgColor
        self.navigationBar.layer.shadowOpacity = 0.2
        self.navigationBar.layer.shadowOffset = CGSize.zero
        self.navigationBar.layer.shadowRadius = 7
    }
    
    func makeNavigationBarRegular() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.shadowColor = .clear
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black0]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black0]
        navBarAppearance.backgroundColor = .appColor(.viewBackground)
        
        self.navigationBar.standardAppearance = navBarAppearance
        self.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        self.navigationBar.layer.shadowColor = .none
        self.navigationBar.layer.shadowOpacity = 0
        self.navigationBar.layer.shadowOffset = CGSize.zero
        self.navigationBar.layer.shadowRadius = 0
    }
    
    func makeNavigationBarOpaque() {
        self.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationBar.isTranslucent = false
        self.navigationBar.tintColor = UIColor.white
    }
    
    func addShadowToNavigation() {
        self.navigationBar.layer.shadowColor = UIColor.black.cgColor
        self.navigationBar.layer.shadowOpacity = 0.2
        self.navigationBar.layer.shadowOffset = CGSize.zero
        self.navigationBar.layer.shadowRadius = 7
    }
    
    func setTitleColor(_ titleColor: UIColor) {
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : titleColor]
    }
    
    func setTitleFont(_ titleFont: UIFont) {
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : titleFont]
    }
}

