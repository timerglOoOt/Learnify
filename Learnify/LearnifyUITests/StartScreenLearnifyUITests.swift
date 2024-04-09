import XCTest

// MARK: - Тимур Хайруллин
final class StartScreenLearnifyUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        let label = app.staticTexts["Start Label"]
        XCTAssert(label.exists)
    }

    func test_if_button_exsist() {
        let app = XCUIApplication()
        app.launch()

        let button = app.buttons["Next"]
        XCTAssert(button.exists)
    }

    func test_button_text_is_not_added() {
        let app = XCUIApplication()
        app.launch()

        let expectedTitle = "Next"
        let button = app.buttons["Next"]
        let buttonTitle = button.title
        XCTAssertNotEqual(buttonTitle, expectedTitle, "Button title doesn't match expected title")
    }
}
