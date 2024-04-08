import XCTest

// MARK: Faki Doosuur Doris

final class LoginScreenLearnifyUITests: XCTestCase {

    override func setUpWithError() throws {

        continueAfterFailure = false
    }

    override func tearDownWithError() throws {

    }

    func testEmailTextFieldExists() throws {

        let app = XCUIApplication()
        app.launch()

        let emailTextField = app.textFields["email"]
        XCTAssertFalse(emailTextField.exists)
    }

    func testPasswordTextFieldExists() throws {
        let app = XCUIApplication()
        app.launch()

        let passwordTextField = app.textFields["password"]
        XCTAssertFalse(passwordTextField.exists)
    }

}
