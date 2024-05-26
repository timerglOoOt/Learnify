//
//  SignInModuleBuilder.swift
//  Learnify
//
//  Created by Тимур Хайруллин on 26.05.2024.
//

import Foundation

// MARK: - Хайруллин Тимур

class LoginModuleBuilder {
    func build(output: LoginOutput) -> LoginViewController {
        let viewVodel = LoginModel()
        viewVodel.delegate = output
        let controller = LoginViewController(viewModel: viewVodel)
        return controller
    }
}
