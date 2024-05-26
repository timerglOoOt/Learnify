//
//  RegistrationViewController.swift
//  Learnify
//
//  Created by Faki Doosuur Doris on 26.05.2024.
//

import UIKit

class RegistrationViewController: UIViewController, RegisterViewDelegate {
    
    var regView: RegistrationView?
    private let viewModel: RegistrationModel

    init( viewModel: RegistrationModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }

    private func setUpViews() {
        regView = RegistrationView(frame: view.bounds)
        view = regView
        view.backgroundColor = .white
        regView?.delegate = self
    }

    func didPressRegister() {
        guard let form = regView?.configureSignUpForm() else {
            self.showAlert(
                title: "Error",
                message: "You are trying to send an empty field! Please enter the text."
            )
            return }
        viewModel.registerUser(user: User(firstname: form.firstname ?? "", surname: form.lastname ?? "", email: form.email ?? "", password: form.password ?? "", commentCount: 12, booksId: ["0"]), password: form.password ?? "")
    }

    func didPresslogin() {
        viewModel.delegate?.goToLoginController()
    }
}
