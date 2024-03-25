import Foundation

// MARK: - Хайруллин Тимур (паттерн Builder)
class BookBuilder {
    private var imageName: String?
    private var title: String?
    private var authors: [String]?
    private var publishedDate: String?
    private var pageCount: Int?
    private var categories: [String]?
    private var previewLink: String?
    private var infoLink: String?
    private var description: String?
    private var averageRating: Double?
    private var ratingsCount: Int?
    private var isSaved: Bool?

    func addImageName(imageName: String) -> Self {
        self.imageName = imageName
        return self
    }

    func addTitle(title: String) -> Self {
        self.title = title
        return self
    }

    func addAuthors(authors: [String]) -> Self {
        self.authors = authors
        return self
    }

    func addPublishedDate(publishedDate: String) -> Self {
        self.publishedDate = publishedDate
        return self
    }

    func addPageCount(pageCount: Int) -> Self {
        self.pageCount = pageCount
        return self
    }

    func addCategories(categories: [String]) -> Self {
        self.categories = categories
        return self
    }

    func addPreviewLink(previewLink: String) -> Self {
        self.previewLink = previewLink
        return self
    }

    func addInfoLink(infoLink: String) -> Self {
        self.infoLink = infoLink
        return self
    }

    func addDescription(description: String) -> Self {
        self.description = description
        return self
    }

    func addAverageRating(averageRating: Double) -> Self {
        self.averageRating = averageRating
        return self
    }

    func addRatingsCount(ratingsCount: Int) -> Self {
        self.ratingsCount = ratingsCount
        return self
    }

    func addIsSaved(isSaved: Bool) -> Self {
        self.isSaved = isSaved
        return self
    }
}

extension BookBuilder {
    func build() -> Book {
    let book = Book(
        imageName: imageName,
        title: title ?? "",
        authors: authors,
        publishedDate: publishedDate,
        pageCount: pageCount,
        categories: categories,
        previewLink: previewLink ?? "",
        infoLink: infoLink ?? "",
        description: description,
        averageRating: averageRating,
        ratingsCount: ratingsCount,
        isSaved: isSaved
        )
        clearBuild()

        return book
    }

    func clearBuild() {
        imageName = nil
        title = nil
        authors = nil
        publishedDate = nil
        pageCount = nil
        categories = nil
        previewLink = nil
        infoLink = nil
        description = nil
        averageRating = nil
        ratingsCount = nil
        isSaved = nil
    }
}
