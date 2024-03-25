//
//  LoginModel.swift
//  Learnify
//
//  Created by Faki Doosuur Doris on 24.03.2024.
//

import Foundation

// MARK: - Faki Doosuur Doris

enum UserValidationError: Error {
    case incorrectCredentionals
}

class LoginModel {

    private let user = User(firstname: "Doosuur", surname: "Faki", email: "doosuur14@gmail.com", password: "12345", commentCount: 2, bookCount: 3, info: "I am a student of ITIS")

    var userValidationResult = Dynamic<Result<User, Error>>(.failure(UserValidationError.incorrectCredentionals))

    func login(_ email: String?, password: String?) {

        if user.email == email && user.password == password {
            userValidationResult.value = .success(user)
            return
        }
        userValidationResult.value = .failure(UserValidationError.incorrectCredentionals)
    }
}
