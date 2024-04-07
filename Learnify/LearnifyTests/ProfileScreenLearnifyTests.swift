import XCTest
@testable import Learnify

// MARK: - Хасаншина Язгуль

final class ProfileScreenLearnifyTests: XCTestCase {

    let modelUser = User(firstname: "Doosuur", surname: "Faki", email: "doosuur14@gmail.com", password: "12345", commentCount: 2, bookCount: 3, info: "I am a student of ITIS")
    lazy var viewModel = ProfileViewModel()

    func test_obtain_user() {
        // GIVEN
        var testUser = User(firstname: "No name", surname: "No namemovich", email: "null", password: "null", commentCount: 0, bookCount: 0)

        // WHEN
        viewModel.obtainCurrentUser { user in
            testUser = user
        }

        // THEN
        XCTAssert(modelUser.email == testUser.email)
    }

    func test_obtain_user_async() {
        let userExpectation = expectation(description: "User expectation")

        viewModel.obtainCurrentUserAsync { _ in
            userExpectation.fulfill()
        }

        waitForExpectations(timeout: 1.0)
    }

    func test_obtain_user_async_noBlock() async {
        _ = await viewModel.obtainCurrentUserAsyncNoBlock()
    }

}
