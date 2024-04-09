import Foundation

// MARK: - Тимур Хайруллин

protocol NetworkServiceProtocol {
    func searchBooks(query: String, completion: @escaping (Result<[Book], Error>) -> Void)
}
