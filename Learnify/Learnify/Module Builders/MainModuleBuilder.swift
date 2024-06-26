//
//  MainModuleBuilder.swift
//  Learnify
//
//  Created by Тимур Хайруллин on 26.05.2024.
//

import Foundation

class MainModuleBuilder {
    func build() -> MainViewController {
        let viewModel = MainViewModel()
        let controller = MainViewController(viewModel: viewModel)
        return controller
    }
}
