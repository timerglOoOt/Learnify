import Foundation
import UIKit

// MARK: - Хайруллин Тимур
class MainViewModel {
    private let books = [
        Book(imageName: "book1", title: "The Midnight Library", authors: ["Matt Haig"], description: "rfgyrfgyryfdvfvfvfvfvfvfvfvfffryfrifyvrv", isSaved: true),
        Book(imageName: "book2", title: "Find a sponsor", authors: ["Sylvia Ann Hewlett"], description: nil, isSaved: nil),
        Book(imageName: "book3", title: "I want a Better Catastrophe", authors: ["Andrew Boyd"], description: nil, isSaved: nil)
    ]

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
}
