//
//  ProfileModuleBuilder.swift
//  Learnify
//
//  Created by Тимур Хайруллин on 26.05.2024.
//

import Foundation

class ProfileModuleBuilder {
    func build() -> ProfileViewController {
        let viewModel = ProfileViewModel()
        let controller = ProfileViewController(viewModel: viewModel)
        return controller
    }
}
