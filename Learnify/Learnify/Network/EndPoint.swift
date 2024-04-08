import Foundation

// MARK: - Хайруллин Тимур
struct EndPoint {
    let path: String
}

extension EndPoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "www.googleapis.com"
        components.path = "/books/v1/volumes"
        components.queryItems = [URLQueryItem(name: "q", value: path), URLQueryItem(name: "maxResults", value: "10")]

        return components.url
    }
}
