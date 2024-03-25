import Foundation

// MARK: - Хайруллин Тимур
struct Book: Codable {
    let imageName: String?
    let title: String
    let authors: [String]?
    let publishedDate: String?
    let pageCount: Int?
    let categories: [String]?
    let previewLink: String
    let infoLink: String
    let description: String?
    let averageRating: Double?
    let ratingsCount: Int?
    let isSaved: Bool?
}
