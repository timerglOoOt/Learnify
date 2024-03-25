import UIKit
import SnapKit

// MARK: - Хайруллин Тимур
class MainTableViewCell: UITableViewCell {
    private lazy var bookImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        return image
    }()

    private lazy var bookNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = .zero
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()

    private lazy var bookAuthorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = .zero
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor.hexStringToUIColor(hex: "3B4631")
        label.textAlignment = .left
        return label
    }()

    private lazy var bookDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 14, weight: .thin)
        label.textColor = UIColor.hexStringToUIColor(hex: "3B4651")
        label.textAlignment = .left
        return label
    }()

    private lazy var bookmarkImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        return image
    }()

    private lazy var infoStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            bookNameLabel,
            bookAuthorLabel,
            bookDescriptionLabel])
        stack.axis = .vertical
        stack.spacing = 1
        stack.setCustomSpacing(4, after: bookAuthorLabel)
        stack.contentMode = .scaleAspectFit
        return stack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainTableViewCell {
    func configure(with book: Book) {
        bookImageView.image = UIImage(named: book.imageName ?? "")
        bookNameLabel.text = book.title
        bookAuthorLabel.text = book.authors?.arrayToString()
        bookDescriptionLabel.text = book.description
        bookmarkImageView.image = UIImage(systemName: ((book.isSaved ?? false) ? "bookmark.fill" : "bookmark"))
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        bookImageView.image = nil
        bookNameLabel.text = nil
        bookAuthorLabel.text = nil
        bookDescriptionLabel.text = nil
        bookmarkImageView.image = nil
    }

    static var reuseIdentifier: String {
        String(describing: self)
    }

    private func setupSubviews() {
        addSubview(bookImageView)
        addSubview(infoStackView)
        addSubview(bookmarkImageView)

        bookImageView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(10)
            make.size.equalTo(CGSize(width: 60, height: 80))
        }
        infoStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalTo(bookImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(15)
            make.bottom.lessThanOrEqualToSuperview().inset(10)
        }

        bookmarkImageView.snp.makeConstraints { make in
            make.trailing.top.equalToSuperview().inset(10)
            make.size.equalTo(CGSize(width: 20, height: 20))
        }
    }
}
