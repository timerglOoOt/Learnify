//
//  LoginScreenView.swift
//  Learnify
//
//  Created by Faki Doosuur Doris on 23.03.2024.
//

import UIKit
import SnapKit

class LoginScreenView: UIView {

    lazy var logoLabel: UILabel = UILabel()
    lazy var email: UILabel = UILabel()
    lazy var emailTextfield: UITextField = UITextField()
    lazy var password: UILabel = UILabel()
    lazy var passwordTextfield: UITextField = UITextField()
    lazy var signInButton: UIButton = UIButton()
    lazy var dontHaveAccount: UILabel = UILabel()
    lazy var signUpNowButton: UIButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpFunctions()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpFunctions() {
        setUpLogoLabel()
        setUpEmailLabel()
        setUpEmail()
        setUpPasswordLabel()
        setUpPassword()
        setUpLoginButton()
        setUpdontHaveAcct()
        setUpRegisterButton()
    }

    private func setUpLogoLabel() {
        addSubview(logoLabel)
        logoLabel.text = "Learnify"
        logoLabel.textColor = UIColor(named: "customcolor")
        logoLabel.font = UIFont.systemFont(ofSize: 35, weight: .semibold)
        logoLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
            make.centerX.equalToSuperview()
        }
    }

    private func setUpEmailLabel() {
        addSubview(email)
        email.text = "Email"
        email.font = .systemFont(ofSize: 15, weight: .semibold)
        email.textColor = .black
        email.snp.makeConstraints { make in
            make.top.equalTo(logoLabel.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(16)
        }
    }

    private func setUpEmail() {
        addSubview(emailTextfield)
        emailTextfield.placeholder = "Email"
        emailTextfield.backgroundColor = .clear
        emailTextfield.borderStyle = .roundedRect
        emailTextfield.textColor = UIColor(named: "SubtitleColor")
        emailTextfield.snp.makeConstraints { make in
            make.top.equalTo(email.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(360)
            make.height.equalTo(50)
        }
    }

    private func setUpPasswordLabel() {
        addSubview(password)
        password.text = "Password"
        password.font = .systemFont(ofSize: 15, weight: .semibold)
        password.textColor = .black
        password.snp.makeConstraints { make in
            make.top.equalTo(emailTextfield.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
        }
    }

    private func setUpPassword() {
        addSubview(passwordTextfield)
        passwordTextfield.placeholder = "Password"
        passwordTextfield.backgroundColor = .clear
        passwordTextfield.borderStyle = .roundedRect
        passwordTextfield.textColor = UIColor(named: "SubtitleColor")
        passwordTextfield.snp.makeConstraints { make in
            make.top.equalTo(password.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(360)
            make.height.equalTo(50)
        }
    }

    private func setUpLoginButton() {
        addSubview(signInButton)
        signInButton.setTitle("SignIn", for: .normal)
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .light)
        signInButton.backgroundColor = UIColor(named: "customcolor")
        signInButton.clipsToBounds = true
        signInButton.layer.cornerRadius = 10
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextfield.snp.bottom).offset(60)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(360)
            make.height.equalTo(50)
        }
    }

    private func setUpdontHaveAcct() {
        addSubview(dontHaveAccount)
        dontHaveAccount.text = "Don't have an account?"
        dontHaveAccount.textColor = .black
        dontHaveAccount.font = UIFont.systemFont(ofSize: 10)
        dontHaveAccount.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
        }
    }

    private func setUpRegisterButton() {
        addSubview(signUpNowButton)
        signUpNowButton.setTitle("SignUp Now!", for: .normal)
        signUpNowButton.backgroundColor = UIColor(named: "secondcustomcolor")
        signUpNowButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .light)
        signUpNowButton.clipsToBounds = true
        signUpNowButton.layer.cornerRadius = 10
        signUpNowButton.snp.makeConstraints { make in
            make.top.equalTo(dontHaveAccount.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(360)
            make.height.equalTo(50)
        }
    }
}
