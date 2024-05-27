//
//  LoginView.swift
//  Learnify
//
//  Created by Faki Doosuur Doris on 24.03.2024.
//

import UIKit

// MARK: Faki Doosuur Doris

protocol LoginViewDelegate: AnyObject {
    func didPressLogin()
    func didPressRegistration()
}
enum AccessibilityIdentifiers {
    static let emailTextField = "email"
    static let passwordTextField = "password"
    static let infoTitleLabel = "info_title_label"
    static let infoLabel = "info_label"
}

class LoginView: UIView {

    lazy var logo: UIImageView = UIImageView()
    lazy var email: UILabel = UILabel()
    lazy var emailTextfield: UITextField = UITextField()
    lazy var password: UILabel = UILabel()
    lazy var passwordTextfield: UITextField = UITextField()
    lazy var signInButton: UIButton = UIButton()
    lazy var dontHaveAccount: UILabel = UILabel()
    lazy var signUpNowButton: UIButton = UIButton()

    weak var delegate: LoginViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpFunctions()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpFunctions() {
        setupLogo()
        setupEmailLabel()
        setupEmail()
        setupPasswordLabel()
        setupPassword()
        setupLoginButton()
        setupdontHaveAcct()
        setupRegisterButton()
    }

    private func setupLogo() {
        addSubview(logo)
        logo.image = UIImage(named: "Logo")
        logo.contentMode = .scaleAspectFit
        logo.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(15)
            make.centerX.equalToSuperview()
            make.height.equalTo(100)
            make.width.equalTo(100)

        }
    }

    private func setupEmailLabel() {
        addSubview(email)
        email.text = "Email"
        email.font = .systemFont(ofSize: 15, weight: .semibold)
        email.textColor = .black
        email.snp.makeConstraints { make in
            make.top.equalTo(logo.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(16)
        }
    }

    private func setupEmail() {
        addSubview(emailTextfield)
        emailTextfield.placeholder = "Email"
        emailTextfield.accessibilityIdentifier = AccessibilityIdentifiers.emailTextField
        emailTextfield.backgroundColor = .systemGray6
        emailTextfield.borderStyle = .roundedRect
        emailTextfield.autocapitalizationType = .none
        emailTextfield.textColor = UIColor(named: "SubtitleColor")
        emailTextfield.snp.makeConstraints { make in
            make.top.equalTo(email.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(360)
            make.height.equalTo(50)
        }
    }

    private func setupPasswordLabel() {
        addSubview(password)
        password.text = "Password"
        password.font = .systemFont(ofSize: 15, weight: .semibold)
        password.textColor = .black
        password.snp.makeConstraints { make in
            make.top.equalTo(emailTextfield.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
    }
}

    private func setupPassword() {
        addSubview(passwordTextfield)
        passwordTextfield.placeholder = "Password"
        passwordTextfield.accessibilityIdentifier = AccessibilityIdentifiers.passwordTextField
        passwordTextfield.isHidden = false
        passwordTextfield.backgroundColor = .systemGray6
        passwordTextfield.borderStyle = .roundedRect
        passwordTextfield.textContentType = .password
        passwordTextfield.isSecureTextEntry = true
        passwordTextfield.textColor = UIColor(named: "SubtitleColor")
        passwordTextfield.snp.makeConstraints { make in
            make.top.equalTo(password.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(360)
            make.height.equalTo(50)
        }
    }

    private func setupLoginButton() {
        addSubview(signInButton)
        signInButton.setTitle("Login", for: .normal)
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .light)
        signInButton.setTitleColor(.gray, for: .highlighted)
        signInButton.backgroundColor = UIColor.hexStringToUIColor(hex: "323390")
        signInButton.clipsToBounds = true
        signInButton.layer.cornerRadius = 10
        let action = UIAction { [weak self] _ in
            self?.delegate?.didPressLogin()
        }
        signInButton.addAction(action, for: .touchUpInside)
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextfield.snp.bottom).offset(90)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(360)
            make.height.equalTo(50)
        }
    }

    private func setupdontHaveAcct() {
        addSubview(dontHaveAccount)
        dontHaveAccount.text = "Don't have an account?"
        dontHaveAccount.textColor = .black
        dontHaveAccount.font = UIFont.systemFont(ofSize: 15)
        let action = UIAction { [weak self] _ in
            self?.delegate?.didPressRegistration()
        }
        signInButton.addAction(action, for: .touchUpInside)
        dontHaveAccount.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
        }
    }

    private func setupRegisterButton() {
        addSubview(signUpNowButton)
        signUpNowButton.setTitle("Register Now!", for: .normal)
        signUpNowButton.backgroundColor = UIColor.hexStringToUIColor(hex: "323390")
        signUpNowButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .light)
        signUpNowButton.setTitleColor(.gray, for: .highlighted)
        signUpNowButton.clipsToBounds = true
        let action = UIAction { [weak self] _ in
            self?.delegate?.didPressRegistration()
        }
        signUpNowButton.addAction(action, for: .touchUpInside)
        signUpNowButton.layer.cornerRadius = 10
        signUpNowButton.snp.makeConstraints { make in
            make.top.equalTo(dontHaveAccount.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(360)
            make.height.equalTo(50)
        }
    }
}

extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        switch textField {
        case emailTextfield:
            passwordTextfield.becomeFirstResponder()
        case passwordTextfield:
            passwordTextfield.resignFirstResponder()
        default: break
        }
        return true
    }

    func configureSignInForm() -> (String?, String?)? {
        let email = emailTextfield.isEmptyTextField()
        let password = passwordTextfield.isEmptyTextField()
        if email || password {
            return nil
        }
        return (emailTextfield.text, passwordTextfield.text)
    }
}
