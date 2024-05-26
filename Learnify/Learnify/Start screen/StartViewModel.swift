//
//  StartViewModel.swift
//  Learnify
//
//  Created by Тимур Хайруллин on 26.05.2024.
//

import Foundation

protocol StartOutput: AnyObject {
//    func goToLogin()
    func goToReg()
}

class StartViewModel {
    weak var delegate: StartOutput?

//    func goToLogin() {
//        delegate?.goToLogin()
//    }
    func goToReg() {
        delegate?.goToReg()
    }
}
