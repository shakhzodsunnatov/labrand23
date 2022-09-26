//
//  AuthTextField.swift
//  Labrand
//
//  Created by Shakhzod on 24/09/22.
//

import UIKit
import SnapKit

class AuthTextField: UITextField {
    
    let checkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark")?.withTintColor(.green)//.tint(tintColor: .green)
        imageView.isHidden = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TextField Name"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 11, weight: .thin)
        return label
    }()
    
    var closureTextFieldDelegate: ((String)-> Void) = {_ in}
    
    var viewState: ViewState? {
        didSet {
            
            guard let viewState = viewState, viewState != oldValue else { return }
            
            switch viewState {
            case .normal:
                layer.borderWidth = 0
                layer.borderColor = UIColor.clear.cgColor
                titleLabel.textColor = .gray
                checkImageView.isHidden = true
                
            case .error:
                layer.borderWidth = 1
                layer.borderColor = UIColor.red.cgColor
                titleLabel.textColor = .red
                checkImageView.isHidden = false
                checkImageView.image = UIImage(systemName: "xmark")?.withTintColor(.red) //.tint(tintColor: .red)
                
            case .ok:
                layer.borderWidth = 0
                layer.borderColor = UIColor.clear.cgColor
                titleLabel.textColor = .gray
                checkImageView.isHidden = false
                checkImageView.image = UIImage(systemName: "checkmark")?.withTintColor(.green) //tint(tintColor: .green)
                
            case .grayed:
                fatalError("Not implemented yet:)")
            }
            
            setNeedsLayout()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(titleLabel)
        
        layer.cornerRadius = 4
        layer.shadowColor = UIColor.black.withAlphaComponent(0.1).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 10
        layer.shadowOffset = CGSize(width: 0, height: 0)
        
        backgroundColor = .white
        textColor = .black
        attributedPlaceholder = NSAttributedString(
            string: "Place type email with @",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray]
        )
        
        rightView = UIView()
        rightView?.addSubview(checkImageView)
        rightViewMode = .always

        self.autocorrectionType = .no
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        self.pin.height(64)
        self.snp.makeConstraints { make in
            make.height.equalTo(64)
        }
//        self.rightView?.pin.size(64)
        self.rightView?.snp.makeConstraints({ make in
            make.size.equalTo(64)
        })
        
//        checkImageView.pin.sizeToFit().center()
        
        checkImageView.sizeToFit()
        checkImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
 
//        titleLabel.pin.sizeToFit().top(14).left(20)
        titleLabel.sizeToFit()
        titleLabel.snp.makeConstraints { make in
            make.topMargin.equalTo(14)
            make.leftMargin.equalTo(20)
        }
    }

    var textPadding = UIEdgeInsets(
        top: 28,
        left: 20,
        bottom: 10,
        right: 20
    )
    

    var sidePadding = UIEdgeInsets(
        top: 0,
        left: 10,
        bottom: 14,
        right: 10
    )
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.rightViewRect(forBounds: bounds)
        return rect.inset(by: sidePadding)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}

extension AuthTextField: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let text = textField.text else { return false }
        
        closureTextFieldDelegate(text)
        
        return true
    }
    
}
