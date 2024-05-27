//
//  RegistrationView.swift
//  Learnify
//
//  Created by Faki Doosuur Doris on 26.05.2024.
//

import UIKit

protocol RegisterViewDelegate: AnyObject {
    func didPressRegister()
    func didPresslogin()
}

class RegistrationView: UIView {
    lazy var appName: UILabel = UILabel()
    lazy var firstname: UITextField = UITextField()
    lazy var lastname: UITextField = UITextField()
    lazy var emailTextfield: UITextField = UITextField()
    lazy var passwordTextfield: UITextField = UITextField()
    lazy var signupButton: UIButton = UIButton()
    lazy var IHaveAccount: UILabel = UILabel()
    lazy var signinButton: UIButton = UIButton()

    weak var delegate: RegisterViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpfunc()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func setUpfunc() {
        setUpAppname()
        setUpFirstName()
        setUpLastName()
        setupEmail()
        setupPassword()
        setupRegisterButton()
        setupHaveAcct()
        setupLoginButton()
    }

    private func setUpAppname() {
        addSubview(appName)
        appName.text = "Learnify"
        appName.textColor = UIColor.hexStringToUIColor(hex: "323390")
        appName.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        appName.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(-10)
            make.centerX.equalToSuperview()
        }
    }

    private func setUpFirstName() {
        addSubview(firstname)
        firstname.placeholder = "First Name"
        firstname.backgroundColor = .systemGray6
        firstname.borderStyle = .roundedRect
        firstname.textColor = UIColor(named: "SubtitleColor")
        firstname.snp.makeConstraints { make in
            make.top.equalTo(appName.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(50)
        }
    }

    private func setUpLastName() {
        addSubview(lastname)
        lastname.placeholder = "Last Name"
        lastname.backgroundColor = .systemGray6
        lastname.borderStyle = .roundedRect
        lastname.textColor = UIColor(named: "SubtitleColor")
        lastname.snp.makeConstraints { make in
            make.top.equalTo(firstname.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(50)
        }
    }

    private func setupEmail() {
        addSubview(emailTextfield)
        emailTextfield.placeholder = "Email"
        emailTextfield.backgroundColor = .systemGray6
        emailTextfield.borderStyle = .roundedRect
        emailTextfield.autocapitalizationType = .none
        emailTextfield.textColor = UIColor(named: "SubtitleColor")
        emailTextfield.snp.makeConstraints { make in
            make.top.equalTo(lastname.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(360)
            make.height.equalTo(50)
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
        passwordTextfield.textColor = UIColor(named: "SubtitleColor")
        passwordTextfield.snp.makeConstraints { make in
            make.top.equalTo(emailTextfield.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(360)
            make.height.equalTo(50)
        }
    }

    private func setupRegisterButton() {
        addSubview(signupButton)
        signupButton.setTitle("Register", for: .normal)
        signupButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .light)
        signupButton.setTitleColor(.gray, for: .highlighted)
        signupButton.backgroundColor = UIColor.hexStringToUIColor(hex: "323390")
        signupButton.clipsToBounds = true
        signupButton.layer.cornerRadius = 10
        let action = UIAction { [weak self] _ in
            self?.delegate?.didPressRegister()
        }
        signupButton.addAction(action, for: .touchUpInside)
        signupButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextfield.snp.bottom).offset(90)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(360)
            make.height.equalTo(50)
        }
    }

    private func setupHaveAcct() {
        addSubview(IHaveAccount)
        IHaveAccount.text = "Already have an account?"
        IHaveAccount.textColor = .black
        IHaveAccount.font = UIFont.systemFont(ofSize: 15)
        let action = UIAction { [weak self] _ in
            self?.delegate?.didPresslogin()
        }
        signinButton.addAction(action, for: .touchUpInside)
        IHaveAccount.snp.makeConstraints { make in
            make.top.equalTo(signupButton.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
        }
    }

    private func setupLoginButton() {
        addSubview(signinButton)
        signinButton.setTitle("Login", for: .normal)
        signinButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .light)
        signinButton.setTitleColor(.gray, for: .highlighted)
        signinButton.backgroundColor = UIColor.hexStringToUIColor(hex: "323390")
        signinButton.clipsToBounds = true
        signinButton.layer.cornerRadius = 10
        let action = UIAction { [weak self] _ in
            self?.delegate?.didPresslogin()
        }
        signinButton.addAction(action, for: .touchUpInside)
        signinButton.snp.makeConstraints { make in
            make.top.equalTo(IHaveAccount.snp.bottom).offset(90)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(360)
            make.height.equalTo(50)
        }
    }
}


extension RegistrationView: UITextFieldDelegate {
    struct SignUpFormData {
        let firstname: String?
        let lastname: String?
        let email: String?
        let password: String?
    }

    func configureSignUpForm() -> SignUpFormData? {
        let firstname1 = firstname.isEmptyTextField()
        let lastname1 = lastname.isEmptyTextField()
        let email = emailTextfield.isEmptyTextField()
        let password = passwordTextfield.isEmptyTextField()
        if  firstname1 || lastname1 || email || password {
            return nil
        }
        return SignUpFormData(firstname: firstname.text, lastname: lastname.text, email: emailTextfield.text, password: passwordTextfield.text)
    }
}
