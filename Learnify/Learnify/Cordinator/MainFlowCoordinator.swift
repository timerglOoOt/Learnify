//
//  MainFlowCoordinator.swift
//  Learnify
//
//  Created by Тимур Хайруллин on 26.05.2024.
//

import Foundation
import UIKit

// MARK: - Хайруллин Тимур

protocol MainFlowCoordinatorProtocol: AnyObject {
    func mainFlowSignOutUser()
}

class MainFlowCoordinator: Coordinator {
    var window: UIWindow
    private var mainFlowCoordinatorProtocol: MainFlowCoordinatorProtocol?

    init(window: UIWindow, mainFlowCoordinatorProtocol: MainFlowCoordinatorProtocol) {
        self.window = window
        self.mainFlowCoordinatorProtocol = mainFlowCoordinatorProtocol
    }

    func start() {
        // TODO: подгружать книжки и инфомацию о пользователе
        let mainViewController = MainModuleBuilder().build()
        mainViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), tag: 0)
        let profileViewController = ProfileModuleBuilder().build()
        profileViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person"), tag: 1)
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [mainViewController, profileViewController]
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
}
