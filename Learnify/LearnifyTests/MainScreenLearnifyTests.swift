import XCTest
@testable import Learnify

// MARK: - Хайруллин Тимур

final class MainScreenLearnifyTests: XCTestCase {
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
    lazy var viewModel = MainViewModel(books: mockBooks)

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

        XCTAssertTrue(viewModel.books.value.contains(testBook), "Book didn't add to books")
    }

    func test_remove_book() {
        let testBook = viewModel.removeBook(at: 1)
        XCTAssertFalse(viewModel.books.value.contains(testBook))
    }

    func test_get_books_async_success() async {
        let books = await viewModel.getBooksAsync()
        XCTAssertTrue(books == mockBooks)
    }
}
