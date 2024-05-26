//
//  LoginModel.swift
//  Learnify
//
//  Created by Faki Doosuur Doris on 24.03.2024.
//

import Foundation

// MARK: - Faki Doosuur Doris

enum UserValidationError: Error {
    case incorrectCredentials
}

// MARK: - Хайруллин Тимур. Протоколы для взаимодействия с FlowCoordinators

protocol LoginOutput: AnyObject {
    func goToSignUpController()
    func signedInUser()
}

protocol SignUpOutput: AnyObject {
    func goToLoginController()
    func signedUpUser()
}

protocol LogoutOutput: AnyObject {
    func logoutUser()
}

class LoginModel {
    weak var delegate: LoginOutput?
    weak var controller: LoginViewController?
    private lazy var firebase = FirebaseManager(alertShowable: controller)
    private let user = User(firstname: "Doosuur", surname: "Faki", email: "doosuur14@gmail.com", password: "12345", commentCount: 2, booksId: [], info: "I am a student of ITIS")

    var userValidationResult = Dynamic<Result<User, Error>>(.failure(UserValidationError.incorrectCredentials))

    func login(_ email: String?, password: String?) {

        if user.email == email && user.password == password {
            userValidationResult.value = .success(user)
            return
        } else {
            userValidationResult.value = .failure(UserValidationError.incorrectCredentials)
        }
    }

    // MARK: - Хайруллин Тимур. Авторизация пользователя с сохранением в UserDefaults
    func signInUser(email: String?, password: String?) {
        controller?.view.showBlurLoader()
        Task {
            let curUser = await firebase.signInUser(email: email, password: password)
            UserDefaults.standard.set(curUser, forKey: "curUser")
            DispatchQueue.main.async { [weak self] in
                self?.delegate?.signedInUser()
                self?.controller?.view.removeBlurLoader()
            }
        }
    }
    func goToSignUpController() {
        delegate?.goToSignUpController()
    }
}
