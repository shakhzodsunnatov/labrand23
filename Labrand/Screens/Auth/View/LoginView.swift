//
//  LoginView.swift
//  Labrand
//
//  Created by Shakhzod on 23/09/22.
//

import UIKit
import SnapKit

protocol ILoginView: AnyObject {
    func nextButtonAction()
}

class LoginView: BaseView {
    
    //MARK: - Properties
    private lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [emailTextField, emailErrorLabel, passwordTextField, passwordErrorLabel, helpButton])
        stack.axis = .vertical
        stack.alignment = .trailing
        stack.distribution = .fill
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.setCustomSpacing(20, after: passwordTextField)
        return stack
    }()
    private lazy var emailTextField: AuthTextField = {
        let textField = AuthTextField()
        textField.keyboardType = .emailAddress
        textField.titleLabel.text = "Email"
        textField.placeholder = "Please type email"
        return textField
    }()
    private lazy var passwordTextField: AuthTextField = {
        let textField = AuthTextField()
        textField.titleLabel.text = "Password"
        textField.placeholder = "Your password"
        return textField
    }()
    private lazy var emailErrorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11, weight: .thin)
        label.text = "Not a valid email address. Should be your@email.com"
        label.textColor = .red
        label.isHidden = true
        return label
    }()
    private lazy var passwordErrorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11, weight: .thin)
        label.text = "Not a valid email address. Should be your@email.com"
        label.textColor = .red
        label.isHidden = true
        return label
    }()
    private lazy var helpButton: Button = {
        let button = Button()
        button.title = "Already have an account?"
        button.titleColor = .black
        
        button.image = UIImage(systemName: "arrow.right")
        button.contentMode = .scaleAspectFit
        button.tintColor = .appColor(.redPrimary)
        button.imagePosition = .right
        
        return button
    }()
    private lazy var nextButton: Button = {
        let button = Button()
        button.title = "Login"
        button.fontSize = 18
        button.color = .appColor(.redPrimary)
        button.addTarget(self, action: #selector(nextButtonAction))
        return button
    }()
    weak var delegate: ILoginView?
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public
    
    @objc func nextButtonAction() {
        delegate?.nextButtonAction()
        
        var allCorrect = true
        
//        if !(emailTextField.text?.contains("@") ?? false) {
//            emailErrorLabel.isHidden = false
//            emailTextField.viewState = .error
//            allCorrect = false
//        }
//
//        if emailTextField.text == "qwerty@gmail.com" {
//            emailTextField.viewState = .ok
//        } else {
//            emailTextField.viewState = .error
//            emailErrorLabel.text = "NOT CORRECT Email"
//            emailErrorLabel.isHidden = false
//            allCorrect = false
//        }
//
//        if passwordTextField.text != "12345" {
//            passwordTextField.viewState = .error
//            passwordErrorLabel.isHidden = false
//            allCorrect = false
//        }
        
        if allCorrect {
//            pushViewController(MainTapBarController())
        }
        
    }
    
    //MARK: - Private
    private func textFieldSubscribers() {
        
        emailTextField.closureTextFieldDelegate = { [weak self] emailText in
            guard let self else { return }
            self.emailErrorLabel.isHidden = true
            self.emailTextField.viewState = .normal
        }
        
        passwordTextField.closureTextFieldDelegate = { [weak self] passwordText in
            guard let self else { return }
            self.passwordTextField.viewState = .normal
            self.passwordErrorLabel.isHidden = true
        }
    }
}

//MARK: - UI Setup
extension LoginView {
    private func setupUI() {
        self.backgroundColor = .appColor(.viewBackground)
        
        addSubview(stack)
        stack.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).inset(70)
            make.width.equalToSuperview().inset(16)
            make.centerX.equalToSuperview()
        }
        emailTextField.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        passwordTextField.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        
        addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.width.equalToSuperview().inset(16)
            make.top.equalTo(stack.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
        }
    }
}
