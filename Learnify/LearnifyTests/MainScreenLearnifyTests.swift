import XCTest
@testable import Learnify
import Combine

// MARK: - Хайруллин Тимур

final class MainScreenLearnifyTests: XCTestCase {
    private var cancellables = Set<AnyCancellable>()
    let mockBooks = [
        BookBuilder()
            .addTitle(title: "1 part")
            .addAuthors(authors: ["Auth 1"])
            .build(),
        BookBuilder()
            .addTitle(title: "2 part")
            .addAuthors(authors: ["Auth 2"])
            .build(),
        BookBuilder()
            .addTitle(title: "3 part")
            .addAuthors(authors: ["Auth 3"])
            .build()
    ]
    let mockNetworkService = MockNetworkService()
    lazy var viewModel = MainViewModel(books: mockBooks, network: mockNetworkService)

    // MARK: Простые тесты

    func test_numb_row_in_section() {
        let numberOfRows = viewModel.numberOfRowsInSection()

        XCTAssertEqual(numberOfRows, mockBooks.count)
    }

    func test_add_book() {
        let testBook = BookBuilder()
            .addTitle(title: "4 part")
            .addAuthors(authors: ["Auth 4"])
            .build()

        viewModel.addBook(testBook)

        XCTAssertTrue(viewModel.books.contains(testBook), "Book didn't add to books")
    }

    func test_remove_book() {
        let testBook = viewModel.removeBook(at: 1)
        XCTAssertFalse(viewModel.books.contains(testBook))
    }

    // MARK: Async тесты
    func test_get_books_async_success() async {
        let books = await viewModel.getBooksAsync()
        XCTAssertTrue(books == mockBooks)
    }

    func test_get_books_by_query_success() {
        let booksExpectation = expectation(description: "Expecting books")
        let expectedURL = "http://www.googleapis.com/books/v1/volumes/mockbooks"

        viewModel.getBooksByQuery(query: expectedURL)
        viewModel.$books
            .sink { _ in
                booksExpectation.fulfill()
            }
            .store(in: &cancellables)

        waitForExpectations(timeout: 1.0)
        XCTAssertEqual(viewModel.books, mockBooks)
    }

    func test_get_books_by_query_failure() {
        let booksExpectation = expectation(description: "Expecting books")
        let unexpectedURL = "http://www.googleapis.com/books/v1/volumes/mock"

        viewModel.errorMessage
            .sink { _ in
                booksExpectation.fulfill()
            }
            .store(in: &cancellables)

        viewModel.getBooksByQuery(query: unexpectedURL)
        waitForExpectations(timeout: 1.0)
    }
}
