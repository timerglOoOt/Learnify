//
//  LoginScreenViewController.swift
//  Learnify
//
//  Created by Faki Doosuur Doris on 23.03.2024.
//

import UIKit

class LoginScreenViewController: UIViewController {
    var loginView: LoginScreenView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    private func setUpView() {
        loginView = LoginScreenView(frame: view.bounds)
        view = loginView
        view.backgroundColor = .white
    }

}
