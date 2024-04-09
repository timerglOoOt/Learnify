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
        app.buttons["Next"].tap()
        let emailTextField = app.textFields["email"]
        XCTAssert(emailTextField.exists, "EmailTextField doesn't exsist!")
    }

    func testPasswordTextFieldExists() throws {

        let app = XCUIApplication()
        app.launch()
        app.buttons["Next"].tap()

        let passwordTextField = app.textFields["password"]
        XCTAssert(passwordTextField.exists, "PasswordTextField doesn't exsist!")
    }

}
