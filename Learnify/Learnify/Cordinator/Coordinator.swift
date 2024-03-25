//
//  Coordinator.swift
//  Learnify
//
//  Created by Faki Doosuur Doris on 24.03.2024.
//

import Foundation
import UIKit

// MARK: - Faki Doosuur Doris
protocol LoginCoordinator {
    func goToLoginPage()
}

class Coordinator: LoginCoordinator {

    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func goToLoginPage() {
        let loginModel = LoginModel()
        let loginViewController = LoginViewController(viewModel: loginModel)
        navigationController.pushViewController(loginViewController, animated: true)
    }

    // MARK: - Хайруллин Тимур
    func goToHomePage() {
        let mainViewModel = MainViewModel()
        let mainViewController = MainViewController(viewModel: mainViewModel)
        navigationController.pushViewController(mainViewController, animated: true)
    }
}
