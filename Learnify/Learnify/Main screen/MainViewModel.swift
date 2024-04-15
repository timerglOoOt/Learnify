import Foundation
import UIKit
import Combine

// MARK: - Хайруллин Тимур
class MainViewModel {
    private let bookBuilder = BookBuilder()
    private var cancellables = Set<AnyCancellable>()
    @Published var books: [Book] = []
    private var network: NetworkServiceProtocol
    var errorMessage: PassthroughSubject<NetworkError, Never> = .init()

    init(books: [Book]? = nil, network: NetworkServiceProtocol? = nil) {
        self.books = books ?? []
        self.network = network ?? NetworkService.shared
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

    func getBooksByQuery(query: String) {
        network.searchBooks(query: query)
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.errorMessage.send(error as? NetworkError ?? .noData)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] books in
                self?.books = books
            }
            .store(in: &cancellables)
    }
}

extension MainViewModel {
    func addBook(_ book: Book) {
        books.append(book)
    }

    func removeBook(at index: Int) -> Book {
        let book = books[index]
        books.remove(at: index)
        return book
    }

    func sortBooksByTitle() {
        books.sort { $0.title < $1.title }
    }

    func filterBooksByAuthor(_ author: String) -> [Book] {
        return books.filter { $0.authors?.contains(author) ?? false }
    }

    func getBooksAsync() async -> [Book] {
        return books
    }
}
