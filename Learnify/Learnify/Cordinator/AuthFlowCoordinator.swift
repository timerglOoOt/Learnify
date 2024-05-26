//
//  AuthFlowCoordinator.swift
//  Learnify
//
//  Created by Тимур Хайруллин on 26.05.2024.
//

import Foundation
import UIKit

// MARK: - Хайруллин Тимур

protocol AuthFlowCoordinatorOutput: AnyObject {
    func authFlowCoordinatorEnteredUser()
}

class AuthFlowCoordinator: Coordinator {
    var navigationController: UINavigationController
    private var authFlowCoordinatorOutput: AuthFlowCoordinatorOutput?

    init(navigationController: UINavigationController, authFlowCoordinatorOutput: AuthFlowCoordinatorOutput) {
        self.navigationController = navigationController
        self.authFlowCoordinatorOutput = authFlowCoordinatorOutput
    }

    func start() {
        let startController = StartModuleBuilder().build(output: self)
        navigationController.setViewControllers([startController], animated: true)
    }
}

extension AuthFlowCoordinator: StartOutput {
    func goToLogin() {
        goToLoginController()
    }
}

// TODO: сделать для регистрации
extension AuthFlowCoordinator: LoginOutput, SignUpOutput {
    func signedInUser() {
        authFlowCoordinatorOutput?.authFlowCoordinatorEnteredUser()
    }

    func signedUpUser() {
        authFlowCoordinatorOutput?.authFlowCoordinatorEnteredUser()
    }

    func goToSignUpController() {
//        let signUpViewController = SignUpModuleBuilder().build(output: self)
//        navigationController.setViewControllers([signUpViewController], animated: true)

    }

    func goToLoginController() {
        let signInViewController = LoginModuleBuilder().build(output: self)
        navigationController.setViewControllers([signInViewController], animated: true)
    }
}
