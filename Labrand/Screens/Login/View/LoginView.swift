//
//  LoginView.swift
//  Labrand
//
//  Created by Shakhzod on 23/09/22.
//

import UIKit
import SnapKit

protocol ILoginView: AnyObject {
    func nextButtonAction(emailText: String, passwordText: String)
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
        stack.setCustomSpacing(20, after: passwordErrorLabel)
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
        label.textAlignment = .center
        return label
    }()
    private lazy var passwordErrorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11, weight: .thin)
        label.text = "Password is not correct"
        label.textColor = .red
        label.isHidden = true
        label.textAlignment = .center
        return label
    }()
    private lazy var helpButton: Button = {
        let button = Button()
        button.title = "Already have an account?"
        button.titleColor = .black0
        button.fontSize = 14
        button.image = UIImage(systemName: "arrow.right")
        button.contentMode = .scaleAspectFit
        button.tintColor = .appColor(.redPrimary)
        button.imagePosition = .right
        
        return button
    }()
    private lazy var nextButton: BaseLoadingButton = {
        let button = BaseLoadingButton()
        button.title = "LOGIN"
        button.font = .mediumFont()
        button.addTarget(self, action: #selector(nextButtonAction))
        
        return button
    }()
    weak var delegate: ILoginView?
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        textFieldSubscribers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public
    
    @objc func nextButtonAction() {
        delegate?.nextButtonAction(emailText: emailTextField.text ?? "", passwordText: passwordTextField.text ?? "")
    }
    
    func showButtonLoader(_ vale: Bool) {
        vale ? nextButton.showLoader() : nextButton.hideLoader()
    }
    
    //MARK: - Validation (Public)
    func showEmailErrorLabel(emailError: Bool, errorMessage: String = "Not a valid email address. Should be your@email.com") {
        emailErrorLabel.isHidden = !emailError
        emailTextField.viewState = emailError ? .error : .normal
        emailErrorLabel.text = errorMessage
    }
    
    func showPasswordErrorLabel(passwordError: Bool, errorMessage: String = "Password is not correct") {
        passwordErrorLabel.isHidden = !passwordError
        passwordTextField.viewState = passwordError ? .error : .normal
        passwordErrorLabel.text = errorMessage
    }
    
    //MARK: - Private
    private func textFieldSubscribers() {
        emailTextField.closureTextFieldDelegate = { [weak self] text in
            guard let self else { return }
            self.emailErrorLabel.isHidden = true
        }
        passwordTextField.closureTextFieldDelegate = { [weak self] text in
            guard let self else { return }
            self.passwordErrorLabel.isHidden = true
        }
    }
}

//MARK: - UI Setup
extension LoginView {
    private func setupUI() {
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing(_:))))
        
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
        emailErrorLabel.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        passwordErrorLabel.snp.makeConstraints { make in
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
