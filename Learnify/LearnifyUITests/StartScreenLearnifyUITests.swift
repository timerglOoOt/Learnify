import XCTest

// MARK: - Тимур Хайруллин
final class StartScreenLearnifyUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
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

        let button = app.buttons["Start button"]
        XCTAssert(button.exists)
    }

    func test_button_text_is_not_added() {
        let app = XCUIApplication()
        app.launch()

        let expectedTitle = "Next"
        let button = app.buttons["Start button"]
        let buttonTitle = button.title
        XCTAssertNotEqual(buttonTitle, expectedTitle, "Button title doesn't match expected title")
    }
}
