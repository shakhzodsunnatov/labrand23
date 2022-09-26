//
//  UIViewController+extension.swift
//  Labrand
//
//  Created by Shakhzod on 22/09/22.
//

import UIKit

extension UIViewController
{
    var topbarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
    
    func calculateHeightForConfiguredSizingCell(cell: UITableViewCell) -> CGFloat
    {
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        let height = cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingExpandedSize).height
        
        return height
    }
    
    var isDarkMode: Bool {
        if #available(iOS 12.0, *) {
            return self.traitCollection.userInterfaceStyle == .dark
        }
        else {
            return false
        }
    }
}

// MARK: - Alerts
extension UIViewController
{
    func showAlert(title: String, action: ((String) -> Void)? = nil) {
        showAlert(title: title, message: nil, closeButtonTitle: "OK", otherButtonTitle: nil, otherButtonTitle2: nil, action: action)
    }
    
    func showAlert(with message: String? = nil, action: ((String) -> Void)? = nil) {
        if message != nil {
            showAlert(title: nil, message: message, closeButtonTitle: "OK", otherButtonTitle: nil, otherButtonTitle2: nil, action: action)
        }
    }
    
    func showAlert(title: String?, message: String?, closeButtonTitle: String, otherButtonTitle: String?, otherButtonTitle2: String?, action: ((String) -> Void)? = nil) {
        
        let alertController = UIAlertController(title: title ?? "", message: message ?? "", preferredStyle: .alert)
        
        let closeAction = UIAlertAction(title: closeButtonTitle, style: .default, handler: {
            alert -> Void in
            guard let action = action else {return}
            
            action(closeButtonTitle)
        })
        alertController.addAction(closeAction)
        
        if let _ = otherButtonTitle {
            let action = UIAlertAction(title: otherButtonTitle, style: .default, handler: {
                alert -> Void in
                
                guard let action = action else {return}
                
                action(otherButtonTitle!)
            })
            
            alertController.addAction(action)
        }
        if let _ = otherButtonTitle2 {
            let action = UIAlertAction(title: otherButtonTitle2, style: .default, handler: {
                alert -> Void in
                
                guard let action = action else {return}
                
                action(otherButtonTitle2!)
            })
            
            alertController.addAction(action)
        }
        
        onMain {
            self.view.window?.rootViewController?.present(alertController, animated: true, completion: nil)
//            self.present(alertController, animated: true, completion: nil)
        }
    }
}
