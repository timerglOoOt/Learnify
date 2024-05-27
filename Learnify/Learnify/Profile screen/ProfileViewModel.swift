import UIKit
import Combine

// MARK: - Хасаншина Язгуль

class ProfileViewModel {
    weak var controller: ProfileViewController?
    private lazy var firebase = FirebaseManager(alertShowable: controller)

    @Published var currentUser: User?

    weak var delegate: LogoutOutput?

    //    @Published var users = [
    //        User(
    //            firstname: "Doosuur",
    //            surname: "Faki",
    //            email: "doosuur14@gmail.com",
    //            password: "12345",
    //            commentCount: 2,
    //            booksId: [],
    //            info: "I am a student of ITIS"
    //        )]
    //
    //    func obtainCurrentUser(closure: (User) -> Void) {
    //        closure(user)
    //    }
    //
    //    func obtainCurrentUserAsync(completionBlock: @escaping (User) -> Void) {
    //        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
    //            completionBlock(self.user)
    //        }
    //    }
    //
    //    func obtainCurrentUserAsyncNoBlock() async -> User {
    //        return user
    //    }
    func logOutUser() {
        controller?.view.showBlurLoader()

        UserDefaults.standard.set("", forKey: "curUser")

        DispatchQueue.main.async { [weak self] in
            self?.delegate?.logoutUser()
            self?.controller?.view.removeBlurLoader()
        }
    }

    func getCurrentUser() {
        let userId = UserDefaults.standard.object(forKey: "curUser") as? String
        if let userId = userId {
            Task {
                let curUser = await firebase.getUser(withId: userId)
            }
        }
    }

}
