import Foundation
import UIKit

// MARK: - Хайруллин Тимур
class MainViewModel {
    private let bookBuilder = BookBuilder()
    private var books: [Book] = []

    init() {
        setupMockData()
    }
}

extension MainViewModel {
    func numberOfRowsInSection() -> Int {
        books.count
    }

    func configureCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseIdentifier, for: indexPath) as? MainTableViewCell
        guard let cell = cell else { return UITableViewCell() }
        cell.configure(with: books[indexPath.row])

        return cell
    }

    func getBooksByRequest(requestString: String?) {
        NetworkDataFetch.shared.fetchBooks(requestString: requestString) { books, error in
            if error != nil {
                print("notify book")
            } else if let books {
                print(books.count)
            }
        }
    }

    private func setupMockData() {
        books = [
            bookBuilder
                .addImageName(imageName: "book1")
                .addTitle(title: "The Midnight Library")
                .addDescription(description: "rfgyrfgyryfdvfvfvfvfvfvfvfvfffryfrifyvrv")
                .addAuthors(authors: ["Matt Haig"])
                .addIsSaved(isSaved: true)
                .build(),
            bookBuilder
                .addImageName(imageName: "book2")
                .addTitle(title: "Find a sponsor")
                .addAuthors(authors: ["Sylvia Ann Hewlett"])
                .build(),
            bookBuilder
                .addImageName(imageName: "book3")
                .addTitle(title: "I want a Better Catastrophe")
                .addAuthors(authors: ["Andrew Boyd"])
                .build()
        ]
    }
}
