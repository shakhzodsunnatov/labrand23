//
//  UIViewController+Additional.swift
//  Labrand
//
//  Created by Shakhzod on 04/10/22.
//

import UIKit

extension UIViewController {
    
    func presentViewController(_ viewControllerToPresent: UIViewController, completion: ( ()-> Void)? = nil ) {
        viewControllerToPresent.modalPresentationStyle = .fullScreen
        
        self.present(viewControllerToPresent, animated: true, completion: completion)
    }
    
    func pushViewController(_ viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func presentSheetModol(_ viewControllerToSheetShow: UIViewController, completion: ( ()-> Void)? = nil ) {
        let detailViewController = viewControllerToSheetShow
        
        
        detailViewController.modalPresentationStyle = .pageSheet

        present(detailViewController, animated: true, completion: completion)

    }
    
    
    func setupNavigationController(_ colorForNavigation: UIColor = .black) {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(
            title: nil,
            style: .plain,
            target: nil,
            action: nil
        )

        self.navigationItem.backBarButtonItem?.tintColor = colorForNavigation
    }
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func goToRoot() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    // Override
    @objc func searchButtonTapped() { }
}
