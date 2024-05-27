import Foundation

// MARK: - Хайруллин Тимур
struct EndPoint {
    var path: String
    var startIndex: Int

    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "www.googleapis.com"
        components.path = "/books/v1/volumes"
        components.queryItems = [
            URLQueryItem(name: "q", value: path),
            URLQueryItem(name: "maxResults", value: "10"),
            URLQueryItem(name: "startIndex", value: "\(startIndex)")
        ]

        return components.url
    }
}
