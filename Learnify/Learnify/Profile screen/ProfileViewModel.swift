import Foundation
import UIKit

// MARK: - Хасаншина Язгуль

class ProfileViewModel {

    private var user = User(
        firstname: "Doosuur", surname: "Faki", commentCount: 2, bookCount: 3, info: "I am a student of ITIS")

    func obtainCurrentUser(closure: (User) -> Void) {
        closure(user)
    }
}
