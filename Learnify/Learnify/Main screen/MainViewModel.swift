import Foundation
import UIKit

// MARK: - Хайруллин Тимур
class MainViewModel {
    private let bookBuilder = BookBuilder()
    let books: Dynamic<[Book]> = Dynamic([])
    let errorMessage: Dynamic<String?> = Dynamic(nil)
}

extension MainViewModel {
    func numberOfRowsInSection() -> Int {
        books.value.count
    }

    func configureCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseIdentifier, for: indexPath) as? MainTableViewCell
        guard let cell = cell else { return UITableViewCell() }
        cell.configure(with: books.value[indexPath.row])

        return cell
    }

    func getBooksByQuery(query: String) {
        NetworkService.shared.searchBooks(query: query) { [weak self] result in
            switch result {
            case .success(let books):
                self?.books.value = books
            case .failure(let error):
                self?.errorMessage.value = error.localizedDescription
            }
        }
    }

//    private func setupMockData() {
//        books = [
//            bookBuilder
//                .addImageName(imageName: "book1")
//                .addTitle(title: "The Midnight Library")
//                .addDescription(description: "rfgyrfgyryfdvfvfvfvfvfvfvfvfffryfrifyvrv")
//                .addAuthors(authors: ["Matt Haig"])
//                .addIsSaved(isSaved: true)
//                .build(),
//            bookBuilder
//                .addImageName(imageName: "book2")
//                .addTitle(title: "Find a sponsor")
//                .addAuthors(authors: ["Sylvia Ann Hewlett"])
//                .build(),
//            bookBuilder
//                .addImageName(imageName: "book3")
//                .addTitle(title: "I want a Better Catastrophe")
//                .addAuthors(authors: ["Andrew Boyd"])
//                .build()
//        ]
//    }
}
