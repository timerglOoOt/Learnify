import Foundation
import Combine

// MARK: - Хайруллин Тимур

class NetworkService: NetworkServiceProtocol {
    static let shared = NetworkService()
    private init() {}

    func searchBooks(query: String, startIndex: Int) -> AnyPublisher<[Book], Error> {
        guard let url = EndPoint(path: query, startIndex: startIndex).url else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: BooksResponse.self, decoder: JSONDecoder())
            .map { BookParser.extractBooks(from: $0) }
            .eraseToAnyPublisher()
    }
}
