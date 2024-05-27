import Foundation
import UIKit

// MARK: - Тимур Хайруллин

struct BookParser {
    static func extractBooks(from response: BooksResponse) -> [Book] {
        var books: [Book] = []
        for item in response.items {
            let book = createBook(from: item.volumeInfo, id: item.id)
                books.append(book)
            }
        return books
    }

    static func createBook(from volumeInfo: BookInfo, id: String) -> Book {
        let bookBuilder = BookBuilder()
        let id = id
        let title = volumeInfo.title
        let authors = volumeInfo.authors ?? ["Unknown Author"]
        let publishedDate = volumeInfo.publishedDate ?? "Unknown Date"
        let description = volumeInfo.description ?? "No Description"

        // FIXME: Проблемы с ATS безопасностью
//        if let imageUrlString = volumeInfo.imageLinks?.thumbnail, let imageUrl = URL(string: imageUrlString) {
//            do {
//                let (data, _) = try await URLSession.shared.data(from: imageUrl)
//                if let image = UIImage(data: data) {
//                    _ = bookBuilder.addImage(bookImage: image)
//                } else {
//                    print("Failed to create image from data")
//                }
//            } catch {
//                print("Error loading image data:", error.localizedDescription)
//            }
//        }

        return bookBuilder
            .addId(id: id)
            .addTitle(title: title)
            .addAuthors(authors: authors)
            .addPublishedDate(publishedDate: publishedDate)
            .addDescription(description: description)
            .build()
    }
}
