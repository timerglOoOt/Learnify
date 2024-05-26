//
//  SignUpModuleBuilder.swift
//  Learnify
//
//  Created by Faki Doosuur Doris on 26.05.2024.
//

import Foundation

class SignUpModuleBuilder {
    func build(output: SignUpOutput) -> RegistrationViewController {
        let viewModel = RegistrationModel()
        viewModel.delegate = output
        let controller = RegistrationViewController(viewModel: viewModel)
        return controller
    }
}
