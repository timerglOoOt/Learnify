//
//  ProfileModuleBuilder.swift
//  Learnify
//
//  Created by Тимур Хайруллин on 26.05.2024.
//

import Foundation

class ProfileModuleBuilder {
    func build(output: LogoutOutput) -> ProfileViewController {
        let viewModel = ProfileViewModel()
        viewModel.delegate = output
        let controller = ProfileViewController(viewModel: viewModel)
        return controller
    }
}
