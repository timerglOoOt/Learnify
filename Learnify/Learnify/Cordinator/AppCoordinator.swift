import Foundation
import UIKit

// MARK: - Хайруллин Тимур

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    // TODO: Добавить сохранение в UserDefaults
//    var isLogged = UserDefaults.standard.string(forKey: "curUser") != ""
    var isLogged = true
    var flowCoordinator: Coordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        if isLogged {
            showMainFlow()
        } else {
            showAuthFlow()
        }
    }
}

private extension AppCoordinator {
    func showMainFlow() {
        flowCoordinator = MainFlowCoordinator(navigationController: navigationController, mainFlowCoordinatorProtocol: self)
        flowCoordinator?.start()
    }

    func showAuthFlow() {
        flowCoordinator = AuthFlowCoordinator(navigationController: navigationController, authFlowCoordinatorOutput: self)
        flowCoordinator?.start()
    }
}

extension AppCoordinator: AuthFlowCoordinatorOutput, MainFlowCoordinatorProtocol {
    func mainFlowSignOutUser() {
        showAuthFlow()
    }

    func authFlowCoordinatorEnteredUser() {
        showMainFlow()
    }
}
