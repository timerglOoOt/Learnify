import Foundation
import Combine
// MARK: - Тимур Хайруллин

protocol NetworkServiceProtocol {
    func searchBooks(query: String, startIndex: Int) -> AnyPublisher<[Book], Error>
}
