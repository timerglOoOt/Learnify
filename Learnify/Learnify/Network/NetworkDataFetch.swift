import Foundation

// MARK: - Хайруллин Тимур
class NetworkDataFetch {
    static let shared = NetworkDataFetch()

    private init() {}

    func fetchBooks(requestString: String?, response: @escaping ([Book]?, NetworkError?) -> Void) {
        NetworkRequest.shared.getData(requestString: requestString) { result in
            switch result {
            case .success(let data):
                do {
                    let books = try JSONDecoder().decode([Book].self, from: data)
                    response(books, nil)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                }
            case .failure(_ ):
                response(nil, .canNotParseData)
            }
        }
    }
}
