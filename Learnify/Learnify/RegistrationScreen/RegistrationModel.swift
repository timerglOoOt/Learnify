//
//  RegistrationModel.swift
//  Learnify
//
//  Created by Faki Doosuur Doris on 26.05.2024.
//

import Foundation

class RegistrationModel {
    weak var delegate: SignUpOutput?
    weak var controller: LoginViewController?
    private lazy var firebase = FirebaseManager(alertShowable: controller)

    func registerUser(user: User ,  password: String) {
        controller?.view.showBlurLoader()
        Task {
            let regUser = await firebase.createUser(user: user, password: password)
            UserDefaults.standard.set(regUser, forKey: "curUser")
            DispatchQueue.main.async { [weak self] in
                self?.delegate?.signedUpUser()
                self?.controller?.view.removeBlurLoader()
            }
        }
    }

    func goToLoginController() {
        delegate?.goToLoginController()
    }

}
