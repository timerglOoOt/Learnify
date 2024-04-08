import Foundation
import UIKit

// MARK: - Хайруллин Тимур

struct Book {
    let bookImage: UIImage?
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

struct BookInfo: Codable {
    let imageLinks: BookImageLinks?
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

struct BookItem: Codable {
    let kind: String
    let id: String
    let volumeInfo: BookInfo
}

struct BooksResponse: Codable {
    let kind: String
    let totalItems: Int
    let items: [BookItem]
}

struct BookImageLinks: Codable {
    let smallThumbnail: String?
    let thumbnail: String?
}
