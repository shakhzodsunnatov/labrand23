//
//  AppService.swift
//  Labrand
//
//  Created by Shakhzod on 22/09/22.
//

import UIKit

class AppService {
    
    static func makeCall(phone: String) {
        if let url = URL(string: "tel://\(phone)"),
            UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    
    static func goToWebLink(string: String) {
        guard let url = URL(string: string) else { return }
        UIApplication.shared.open(url)
    }
    
    
    
    static func openShareUtility(url: String) {
        let textToShare = [url]
        
        let activityViewController = UIActivityViewController(
            activityItems: textToShare,
            applicationActivities: nil)
        
        activityViewController.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook]
        
        if let window = UIApplication.shared.keyWindow
        {
            if let modalVC = window.rootViewController?.presentedViewController
            {
                onMain {
                    modalVC.present(activityViewController,
                                    animated: true,
                                    completion: nil)
                }
            }
            else {
                onMain {
                    window.rootViewController!.present(activityViewController,
                                                   animated: true,
                                                   completion: nil)
                }
            }
        }
    }
}
