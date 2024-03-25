import Foundation

// MARK: - Хайруллин Тимур
struct Book: Decodable {
    let imageName: String?
    let title: String
    let authors: [String]?
    let description: String?
    let isSaved: Bool?
}
