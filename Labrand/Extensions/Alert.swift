//
//  Alert.swift
//  Labrand
//
//  Created by Shakhzod on 22/09/22.
//

import UIKit

class Alert
{
    static func alertMessage(title: String = "",
                             _ message: String?,
                             _ actionTitle: String = "OK",
                             completion: @escaping () -> Void)
    {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: actionTitle,
                                      style: UIAlertAction.Style.default,
                                      handler:
                                        { _ in
            completion()
        }))
        
        if let _ = message, let window = UIApplication.shared.keyWindow
        {
            if let modalVC = window.rootViewController?.presentedViewController,
               actionTitle != "СВЯЗАТЬСЯ С ОПЕРАТОРОМ"
            {
                onMain {
                    modalVC.present(alert,
                                    animated: true,
                                    completion: nil)
                }
            }
            else
            {
                onMain {
                    window.rootViewController!.present(alert,
                                                       animated: true,
                                                       completion: nil)
                }
            }
        }
    }
    
    static func alertCancelOkMessage(_ title: String,
                                     _ message: String,
                                     _ ok: String,
                                     _ cancel: String,
                                     completion: @escaping () -> Void)
    {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let ok = UIAlertAction(title: ok,
                               style: .default)
        { (_ action) in
            completion()
        }
        
        let cancel = UIAlertAction(title: cancel ,
                                   style: .cancel)
        { (_ action) in
        }
        
        ok.setValue(UIColor.green, forKey: "titleTextColor")
        cancel.setValue(UIColor.gray, forKey: "titleTextColor")
        alertController.addAction(ok)
        alertController.addAction(cancel)
        alertController.view.tintColor = UIColor.yellow
        
        if let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first
        {
            if let modalVC = window.rootViewController?.presentedViewController
            {
                modalVC.present(alertController,
                                animated: true,
                                completion: nil)
            }
            else
            {
                window.rootViewController!.present(alertController,
                                                   animated: true,
                                                   completion: nil)
            }
        }
    }
    
    static func alertMessageChangeBaseUrl(_ title: String,
                                          _ message: String,
                                          prodCompletion: @escaping () -> Void,
                                          stagingCompletion: @escaping () -> Void,
                                          testCompletion: @escaping () -> Void,
                                          cancelCompletion: @escaping () -> Void)


    {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Production",
                                      style: UIAlertAction.Style.default,
                                      handler:
                                        { _ in
            prodCompletion()
        }))

        alert.addAction(UIAlertAction(title: "Staging",
                                      style: UIAlertAction.Style.default,
                                      handler:
                                        { _ in
            stagingCompletion()
        }))

        alert.addAction(UIAlertAction(title: "Debug",
                                      style: UIAlertAction.Style.default,
                                      handler:
                                        { _ in
            testCompletion()
        }))

        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: UIAlertAction.Style.cancel,
                                      handler:
                                        { _ in
            cancelCompletion()
        }))
        
        if let window = UIApplication.shared.keyWindow
        {
            if let modalVC = window.rootViewController?.presentedViewController
            {
                if message.count == 4
                {
                    window.rootViewController!.present(alert,
                                                       animated: true,
                                                       completion: nil)
                }
                else
                {
                    modalVC.present(alert,
                                    animated: true,
                                    completion: nil)
                }
            }
            else
            {
                window.rootViewController!.present(alert,
                                                   animated: true,
                                                   completion: nil)
            }
        }
    }


    static func alertMessageChangeLanguage(_ title: String,
                                           _ message: String,
                                           completion: @escaping (String) -> Void) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "English",
                                      style: UIAlertAction.Style.default,
                                      handler:
                                        { _ in
            completion("en")
        }))
        alert.addAction(UIAlertAction(title: "Русский ",
                                      style: UIAlertAction.Style.default,
                                      handler:
                                        { _ in
            completion("ru")
        }))
        alert.addAction(UIAlertAction(title: "O'zbekcha",
                                      style: UIAlertAction.Style.default,
                                      handler:
                                        { _ in
            completion("uz")
        }))
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) {
            (_ action) in
        }
        cancel.setValue(UIColor.black.withAlphaComponent(0.5), forKey: "titleTextColor")
        alert.addAction(cancel)
        
        if let window = UIApplication.shared.keyWindow
        {
            if let modalVC = window.rootViewController?.presentedViewController
            {
                if message.count == 4
                {
                    window.rootViewController!.present(alert,
                                                       animated: true,
                                                       completion: nil)
                }
                else
                {
                    modalVC.present(alert,
                                    animated: true,
                                    completion: nil)
                }
            }
            else
            {
                window.rootViewController!.present(alert,
                                                   animated: true,
                                                   completion: nil)
            }
        }
    }
}
