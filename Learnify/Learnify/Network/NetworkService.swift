import Foundation

// MARK: - Хайруллин Тимур

class NetworkService: NetworkServiceProtocol {
    static let shared = NetworkService()
    private init() {}

    func searchBooks(query: String, completion: @escaping (Result<[Book], Error>) -> Void) {
        guard let url = EndPoint(path: query).url else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(BooksResponse.self, from: data)
                let books = BookParser.extractBooks(from: response)
                completion(.success(books))
            } catch {
                completion(.failure(NetworkError.decodingError))
            }
        }.resume()
    }
}
