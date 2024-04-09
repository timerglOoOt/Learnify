import XCTest
@testable import Learnify

// MARK: Faki Doosuur Doris

final class LoginScreenLearnifyTests: XCTestCase {

    private let user = User(firstname: "Doosuur", surname: "Faki", email: "doosuur14@gmail.com", password: "12345", commentCount: 2, bookCount: 3, info: "I am a student of ITIS")
    let viewModel = LoginModel()


    func test_User_Login_Sucess() {

        let testUser = user
        let expectation = XCTestExpectation(description: "User login sucess")

        viewModel.userValidationResult.bind { result in
            switch result {
            case .success(let user):
                XCTAssertEqual(user, testUser, "user should be successfully logged in")
                expectation.fulfill()
            default:
                break
            }
        }
        viewModel.login(user.email, password: user.password)
        wait(for: [expectation], timeout: 5)
    }

    func test_User_Login_Failed() {
        let incorrectEmail = "Doosuur"
        let incorrectPassword = "Doosuur"

        let expectation = XCTestExpectation(description: "User login failure")

        viewModel.userValidationResult.bind { result in
            switch result {
            case .failure(let error as UserValidationError):
                XCTAssertEqual(error, UserValidationError.incorrectCredentials, "Login process should fail with incorrect email and password")
                expectation.fulfill()
            default:
                break
            }
        }
        viewModel.login(incorrectEmail, password: incorrectPassword)
        wait(for: [expectation], timeout: 5)
    }

    func test_Login_Failed_EmptyEmailAndPassword() {

        let emptyEmail: String? = ""
        let emptyPassword: String? = ""

        let expectation = XCTestExpectation(description: "User login failure")

        viewModel.userValidationResult.bind { result in
            switch result {
            case .failure(let error as UserValidationError):
                XCTAssertEqual(error, UserValidationError.incorrectCredentials, "Login should fail with empty textfields")
                expectation.fulfill()
            default:
                break
            }
        }

        viewModel.login(emptyEmail, password: emptyPassword)
        wait(for: [expectation], timeout: 5)
    }
}
