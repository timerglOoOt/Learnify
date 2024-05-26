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
    var window: UIWindow
    private var authFlowCoordinatorOutput: AuthFlowCoordinatorOutput?

    init(window: UIWindow, authFlowCoordinatorOutput: AuthFlowCoordinatorOutput) {
        self.window = window
        self.authFlowCoordinatorOutput = authFlowCoordinatorOutput
    }

    func start() {
        let startController = StartModuleBuilder().build(output: self)
        window.rootViewController = startController
        window.makeKeyAndVisible()
    }
}

extension AuthFlowCoordinator: StartOutput {
    func goToReg() {
        goToSignUpController()
    }
    
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
        let signUpViewController = SignUpModuleBuilder().build(output: self)
        window.rootViewController = signUpViewController
        window.makeKeyAndVisible()

    }

    func goToLoginController() {
        let signInViewController = LoginModuleBuilder().build(output: self)
        window.rootViewController = signInViewController
        window.makeKeyAndVisible()
    }
}
