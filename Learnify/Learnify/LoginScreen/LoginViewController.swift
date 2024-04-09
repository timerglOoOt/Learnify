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

    private var coordinator: Coordinator?

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
        coordinator = Coordinator(navigationController: navigationController ?? UINavigationController())
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        setUpBinder()
    }

    private func setUpBinder() {
        viewModel.userValidationResult.bind { [weak self] result in
            switch result {
            case .success:
                print("success")
                self?.coordinator?.goToHomePage()
            case .failure(let error):
                print("Failure \(error.localizedDescription)")
            }
        }
    }
}

extension LoginViewController: LoginViewDelegate {
    func didPressLogin() {
        guard let email = contentView.emailTextfield.text, let password = contentView.passwordTextfield.text else {
            print("Please enter email and password")
            return
        }
        viewModel.login(email, password: password)
    }
}
