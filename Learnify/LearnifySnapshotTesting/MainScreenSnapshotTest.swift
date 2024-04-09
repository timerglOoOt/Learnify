import XCTest
import SnapshotTesting
@testable import Learnify

// MARK: Тимур Хайруллин

final class MainScreenSnapshotTest: XCTestCase {
    private lazy var bookBuilder = BookBuilder()
    private lazy var mockBooks = [
        bookBuilder
            .addAuthors(authors: ["Test1"])
            .addTitle(title: "Title1")
            .addDescription(description: "TestTitle1")
            .build(),
        bookBuilder
            .addAuthors(authors: ["Test2"])
            .addTitle(title: "Title2")
            .addDescription(description: "TestTitle2")
            .build(),
        bookBuilder
            .addAuthors(authors: ["Test3"])
            .addTitle(title: "Title3")
            .addDescription(description: "TestTitle3")
            .build()
    ]
    private lazy var viewModel = MainViewModel(books: mockBooks)
    private lazy var mainViewController = MainViewController(viewModel: viewModel)

    override func setUpWithError() throws {

    }

// MARK: Базовые тесты
    func test_main_screen_on_iphone_13ProMax_landscape() throws {
        assertSnapshots(of: mainViewController, as: [.image(on: .iPhone13ProMax(.landscape))])
    }

    func test_main_screen_on_iphone_13ProMax_portrait() throws {
        assertSnapshots(of: mainViewController, as: [.image(on: .iPhone13ProMax(.portrait))])
    }

    func test_main_screen_cell() throws {
        let cell = MainTableViewCell(frame: CGRect(x: 0, y: 0, width: 400, height: 300))
        cell.configure(with: mockBooks[0])
        cell.backgroundColor = .white
        assertSnapshots(of: cell, as: [.image()])
    }
}
