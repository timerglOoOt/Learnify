import Foundation
import UIKit

class MainViewModel {
    private let books = [
        Book(imageName: "book1", name: "The Midnight Library", author: "Matt Haig", description: "rfgyrfgyryfdvfvfvfvfvfvfvfvfffryfrifyvrv", isSaved: true),
        Book(imageName: "book2", name: "Find a sponsor", author: "Sylvia Ann Hewlett", description: nil, isSaved: nil),
        Book(imageName: "book3", name: "I want a Better Catastrophe", author: "Andrew Boyd", description: nil, isSaved: nil)
    ]
    func configureCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseIdentifier, for: indexPath) as? MainTableViewCell
        guard let cell = cell else { return UITableViewCell() }
        cell.configure(with: books[indexPath.row])

        return cell
    }
}
