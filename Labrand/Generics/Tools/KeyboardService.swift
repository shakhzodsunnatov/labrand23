//
//  KeyboardService.swift
//  Labrand
//
//  Created by Shakhzod on 22/09/22.
//

import UIKit

class KeyboardService: NSObject {
    
    // MARK: Properties
    static var serviceSingleton = KeyboardService()
    var measuredSize: CGRect = .zero
    
    // MARK: Public
    @objc class func keyboardHeight() -> CGFloat {
        let keyboardSize = KeyboardService.keyboardSize()
        return keyboardSize.size.height
    }

    @objc class func keyboardSize() -> CGRect {
        return serviceSingleton.measuredSize
    }
    
    // MARK: Private
    private func observeKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardChange), name: UIResponder.keyboardDidShowNotification, object: nil)
    }

    private func observeKeyboard() {
        let field = UITextField()
        field.autocorrectionType = .no
        field.spellCheckingType = .no
        field.inputAccessoryView = UIView(frame: .zero)
        UIApplication.shared.windows.first?.addSubview(field)
        field.becomeFirstResponder()
        field.resignFirstResponder()
        field.removeFromSuperview()
    }
    
    @objc private func keyboardChange(_ notification: Notification) {
        guard measuredSize == CGRect.zero, let info = notification.userInfo,
              let value = info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
            else { return }

        measuredSize = value.cgRectValue
    }
    
    // MARK: Init
    private override init() {
        super.init()
        observeKeyboardNotifications()
        observeKeyboard()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

