import Foundation

// MARK: - Хайруллин Тимур
class NetworkRequest {
    static let shared = NetworkRequest()

    private init() {}

    func getData(requestString: String?, completionHandler: @escaping (Result<Data, NetworkError>) -> Void) {
        URLSession.shared.request(EndPoint(path: requestString ?? "")) { data, _, error in
            if error != nil {
                completionHandler(.failure(.urlError))
            } else {
                guard let data else { return }
                completionHandler(.success(data))
            }
        }
    }
}
