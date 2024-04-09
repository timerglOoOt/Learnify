import Foundation
import UIKit

// MARK: - Хайруллин Тимур
class MainViewModel {
    private let bookBuilder = BookBuilder()
    var books: Dynamic<[Book]> = Dynamic([])
    var errorMessage: Dynamic<String?> = Dynamic(nil)
    var network: NetworkServiceProtocol?

    init(books: [Book]? = nil, network: NetworkServiceProtocol? = nil) {
        self.books = Dynamic(books ?? [])
        self.errorMessage = Dynamic(nil)
        self.network = network
    }
}

extension MainViewModel {
    func numberOfRowsInSection() -> Int {
        books.value.count
    }

    func configureCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseIdentifier, for: indexPath) as? MainTableViewCell
        guard let cell = cell else { return UITableViewCell() }
        cell.configure(with: books.value[indexPath.row])

        return cell
    }

    func getBooksByQuery(query: String) {
        network?.searchBooks(query: query) { [weak self] result in
            switch result {
            case .success(let books):
                self?.books.value = books
            case .failure(let error):
                self?.errorMessage.value = error.localizedDescription
            }
        }
    }

//    private func setupMockData() {
//        books = [
//            bookBuilder
//                .addImageName(imageName: "book1")
//                .addTitle(title: "The Midnight Library")
//                .addDescription(description: "rfgyrfgyryfdvfvfvfvfvfvfvfvfffryfrifyvrv")
//                .addAuthors(authors: ["Matt Haig"])
//                .addIsSaved(isSaved: true)
//                .build(),
//            bookBuilder
//                .addImageName(imageName: "book2")
//                .addTitle(title: "Find a sponsor")
//                .addAuthors(authors: ["Sylvia Ann Hewlett"])
//                .build(),
//            bookBuilder
//                .addImageName(imageName: "book3")
//                .addTitle(title: "I want a Better Catastrophe")
//                .addAuthors(authors: ["Andrew Boyd"])
//                .build()
//        ]
//    }
}

extension MainViewModel {
    func addBook(_ book: Book) {
        books.value.append(book)
    }

    func removeBook(at index: Int) -> Book {
        let book = books.value[index]
        books.value.remove(at: index)
        return book
    }

    func sortBooksByTitle() {
        books.value.sort { $0.title < $1.title }
    }

    func filterBooksByAuthor(_ author: String) -> [Book] {
        return books.value.filter { $0.authors?.contains(author) ?? false }
    }

    func getBooksAsync() async -> [Book] {
        return books.value
    }
}
