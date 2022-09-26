//
//  BaseViewController.swift
//  Labrand
//
//  Created by Shakhzod on 22/09/22.
//

import UIKit

class BaseViewController: UIViewController, UIGestureRecognizerDelegate {
    
    //MARK: - Properties
    var rootNavigation: BaseNavigationController? {
        if let nvc = self.navigationController as? BaseNavigationController {
            return nvc
        } else {
            return nil
        }
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        debugPrint("\n\n\n\n\n\n$$$$$")
        debugPrint(self)
        debugPrint("\n\n\n\n\n\n")
        
        view.backgroundColor = .appColor(.viewBackground)
        rootNavigation?.setupSwipingGestures()
    }
    
    //MARK: - Helper functions
    func makeVisibleNavigation() {
        if #available(iOS 15.0, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithDefaultBackground()
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        }
    }
    
    func closeKeyboard() {
        self.view.addGestureRecognizer(UIGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    func setupSwipingGesture(isEnabled: Bool = true) {
        self.navigationItem.hidesBackButton = true
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = isEnabled
        self.navigationController?.interactivePopGestureRecognizer?.delegate = isEnabled ? self : nil
    }
    
    func removeSeporateLineBottomOfNavigation() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: ""), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage(named: "")
        self.navigationController?.navigationBar.layoutIfNeeded()

        self.navigationController?.navigationBar.setBackgroundImage(nil, for:.default)
        self.navigationController?.navigationBar.shadowImage = nil
        self.navigationController?.navigationBar.layoutIfNeeded()

        if #available(iOS 15, *) {
            guard let navigationBar = navigationController?.navigationBar else { return }

            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
//            appearance.backgroundColor = ColorCompatibility.parentViewBackGroundColor
            appearance.shadowColor = .clear
            appearance.shadowImage = UIImage()

            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
        }
    }
}
