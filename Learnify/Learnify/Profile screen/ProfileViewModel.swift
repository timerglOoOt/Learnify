import Foundation
import UIKit
import Combine

// MARK: - Хасаншина Язгуль

class ProfileViewModel {

    private var user = User(firstname: "Doosuur", surname: "Faki", email: "doosuur14@gmail.com", password: "12345", commentCount: 2, bookCount: 3, info: "I am a student of ITIS")

    @Published var users = [User(firstname: "Doosuur", surname: "Faki", email: "doosuur14@gmail.com", password: "12345", commentCount: 2, bookCount: 3, info: "I am a student of ITIS")]


    func obtainCurrentUser(closure: (User) -> Void) {
        closure(user)
    }

    func obtainCurrentUserAsync(completionBlock: @escaping (User) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            completionBlock(self.user)
        }
    }

    func obtainCurrentUserAsyncNoBlock() async -> User {
        return user
    }
}
