import Foundation
import UIKit

// MARK: - Тимур Хайруллин

struct BookParser {
    static func extractBooks(from response: BooksResponse) -> [Book] {
        var books: [Book] = []
        for item in response.items {
            let book = createBook(from: item.volumeInfo)
                books.append(book)
            }
        return books
    }

    static func createBook(from volumeInfo: BookInfo) -> Book {
        let bookBuilder = BookBuilder()
        let title = volumeInfo.title
        let authors = volumeInfo.authors ?? ["Unknown Author"]
        let publishedDate = volumeInfo.publishedDate ?? "Unknown Date"
        let description = volumeInfo.description ?? "No Description"

        // FIXME: разобраться, как подтянуть картинку, пока пишет, что соединение не безопасно
//        if let imageUrlString = volumeInfo.imageLinks?.thumbnail,
//        let imageUrl = URL(string: imageUrlString) {
//        do {
//            let imageData = try Data(contentsOf: imageUrl)
//            let image = UIImage(data: imageData)
//            bookBuilder.addImage(bookImage: image)
//        } catch {
//            print("Error loading image data:", error.localizedDescription)
//            }
//        }
        return bookBuilder
            .addTitle(title: title)
            .addAuthors(authors: authors)
            .addPublishedDate(publishedDate: publishedDate)
            .addDescription(description: description)
            .build()
    }
}
