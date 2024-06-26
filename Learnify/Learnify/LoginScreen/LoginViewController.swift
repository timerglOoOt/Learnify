//
//  LoginViewController.swift
//  Learnify
//
//  Created by Faki Doosuur Doris on 24.03.2024.
//

import UIKit

// MARK: - Faki Doosuur Doris

class LoginViewController: UIViewController {

    private let contentView: LoginView = .init()

    private let viewModel: LoginModel

    init(viewModel: LoginModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.delegate = self
        viewModel.controller = self
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
//        setUpBinder()
    }

//    private func setUpBinder() {
//        viewModel.userValidationResult.bind { [weak self] result in
//            switch result {
//            case .success:
//                print("success")
////                self?.viewModel.signInUser()
//            case .failure(let error):
//                print("Failure \(error.localizedDescription)")
//            }
//        }
//    }
}

// MARK: - Хайруллин Тимур

extension LoginViewController: LoginViewDelegate {
    func didPressRegistration() {
        viewModel.goToSignUpController()
    }

    func didPressLogin() {
        guard let form = contentView.configureSignInForm() else {
            self.showAlert(
                title: "Error",
                message: "You are trying to send an empty field! Please enter the text."
            )
            return }
        viewModel.signInUser(email: form.0, password: form.1)
    }
}
