import Foundation
import UIKit

// MARK: - Хайруллин Тимур

class AppCoordinator: Coordinator {
    var window: UIWindow
    // TODO: Добавить сохранение в UserDefaults
    var isLogged = UserDefaults.standard.string(forKey: "curUser") != ""
//    var isLogged = false
    var flowCoordinator: Coordinator?

    init(window: UIWindow) {
            self.window = window
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
        flowCoordinator = MainFlowCoordinator(window: window, mainFlowCoordinatorProtocol: self)
        flowCoordinator?.start()
    }

    func showAuthFlow() {
        flowCoordinator = AuthFlowCoordinator(window: window, authFlowCoordinatorOutput: self)
        flowCoordinator?.start()
    }
}

extension AppCoordinator: AuthFlowCoordinatorOutput, MainFlowCoordinatorProtocol {
    func logoutFromTabBar() {

    }
    
    func mainFlowSignOutUser() {
        showAuthFlow()
    }

    func authFlowCoordinatorEnteredUser() {
        showMainFlow()
    }
}
