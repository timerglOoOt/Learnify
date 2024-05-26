//
//  StartModuleBuilder.swift
//  Learnify
//
//  Created by Тимур Хайруллин on 26.05.2024.
//

import Foundation

class StartModuleBuilder {
    func build(output: StartOutput) -> StartViewController {
        let viewModel = StartViewModel()
        viewModel.delegate = output
        let controller = StartViewController(viewModel: viewModel)
        return controller
    }
}
