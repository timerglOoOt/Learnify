import Foundation
import UIKit
import Combine

// MARK: - Хайруллин Тимур
class MainViewModel: ObservableObject {
    private let firebase = FirebaseManager(alertShowable: nil)
    private var cancellables = Set<AnyCancellable>()
    @Published var books: [Book] = []
    @Published var isLoading = false
    private var network: NetworkServiceProtocol
    var errorMessage: PassthroughSubject<NetworkError, Never> = .init()
    private var currentPage: Int = 0
    private var currentQuery: String = ""

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
        isLoading = true
        currentQuery = query.isEmpty ? "Котики" : query
        currentPage = 0
        books = []
        loadMoreBooks()
    }

    func loadMoreBooks() {
        isLoading = true
        network.searchBooks(query: currentQuery, startIndex: currentPage * 10)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.errorMessage.send(error as? NetworkError ?? .noData)
                case .finished:
                    break
                }
                self?.isLoading = false
            } receiveValue: { [weak self] newBooks in
                self?.books.append(contentsOf: newBooks)
                self?.currentPage += 1
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

extension MainViewModel {
    func addBookToFirebase(userId: String, bookId: String) {
        Task {
            await firebase.addBook(toUserId: userId, bookId: bookId)
        }
    }

    func deleteBookFromFirebase(userId: String, bookId: String) {
        Task {
            await firebase.removeBook(fromUserId: userId, bookId: bookId)
        }
    }
}
